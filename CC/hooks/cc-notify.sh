#!/bin/bash
# Claude Code unified notification hook
# Usage: cc-notify.sh waiting|completed
#
#   waiting   -> fires unconditionally (you are actually being summoned)
#   completed -> fires ONLY if the turn ran longer than CC_NOTIFY_MIN_SECS
#                (long task vs quick reply). Quick turns stay silent.
#
# Channels: desktop (notify-send) + tmux. The zellij path was intentionally
# removed to stop per-tab attention spam across parallel sessions.

set -u

EVENT="${1:-waiting}"

# Minimum turn duration (seconds) before a "completed" notification fires.
MIN_SECS="${CC_NOTIFY_MIN_SECS:-60}"

# --- read hook stdin to recover the session id ---
INPUT="$(cat 2>/dev/null || true)"
SID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null || true)"
[ -z "$SID" ] && SID="default"

STAMP_DIR="${TMPDIR:-/tmp}/cc-notify"
STAMP_FILE="$STAMP_DIR/turn-${SID}.start"

# --- completed: gate on turn duration ---
if [ "$EVENT" = "completed" ]; then
  NOW="$(date +%s)"
  if [ -f "$STAMP_FILE" ]; then
    START="$(cat "$STAMP_FILE" 2>/dev/null || echo "$NOW")"
    rm -f "$STAMP_FILE" 2>/dev/null || true
    ELAPSED=$(( NOW - START ))
    # Quick turn -> stay quiet.
    if [ "$ELAPSED" -lt "$MIN_SECS" ]; then
      exit 0
    fi
  fi
  # No stamp file -> unknown duration -> fail open (notify). Rare, because
  # UserPromptSubmit writes the stamp on every turn.
fi

case "$EVENT" in
  waiting)
    URGENCY="critical"
    ICON="dialog-warning"
    TITLE="Claude Code"
    MSG="⚠ needs your input"
    BELL=1
    ;;
  completed)
    URGENCY="normal"
    ICON="dialog-information"
    TITLE="Claude Code"
    MSG="✓ long task complete"
    BELL=0
    ;;
  *)
    URGENCY="low"
    ICON="dialog-information"
    TITLE="Claude Code"
    MSG="$EVENT"
    BELL=0
    ;;
esac

# --- tmux path ---
if [ -n "${TMUX:-}" ] && command -v tmux >/dev/null 2>&1; then
  # Bell rings in current pane → tmux's monitor-bell flags the window with `!`
  # AND fires the alert-bell hook (defined in ~/.tmux.conf) for desktop notify.
  if [ "$BELL" -eq 1 ]; then
    printf '\a' >/dev/tty 2>/dev/null || true
  fi
  tmux display-message -d 3000 "${TITLE}: ${MSG}" >/dev/null 2>&1 || true
fi

# --- desktop notification (always, independent of multiplexer) ---
if command -v notify-send >/dev/null 2>&1; then
  notify-send -u "$URGENCY" -i "$ICON" -a "claude-code" "$TITLE" "$MSG" >/dev/null 2>&1 || true
fi

# --- phone push via ntfy.sh: WAITING ONLY ---
# Replaces the native agentPushNotif (which can't be filtered by event type).
# Topic comes from CC_NTFY_TOPIC env so the secret stays out of this repo.
if [ "$EVENT" = "waiting" ] && [ -n "${CC_NTFY_TOPIC:-}" ] && command -v curl >/dev/null 2>&1; then
  curl -fsS -m 5 \
    -H "Title: ${TITLE}" \
    -H "Priority: high" \
    -H "Tags: warning" \
    -d "needs your input" \
    "https://ntfy.sh/${CC_NTFY_TOPIC}" >/dev/null 2>&1 || true
fi

exit 0
