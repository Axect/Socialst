#!/bin/bash
# Claude Code unified notification hook
# Usage: cc-notify.sh waiting|completed
# Fires desktop notification + multiplexer-specific signals (zellij, tmux).

set -u

EVENT="${1:-waiting}"

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
    MSG="✓ task complete"
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

# --- zellij path ---
if [ -n "${ZELLIJ_PANE_ID:-}" ] && command -v zellij >/dev/null 2>&1; then
  zellij pipe --name "zellij-attention::${EVENT}::${ZELLIJ_PANE_ID}" >/dev/null 2>&1 || true
fi

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

exit 0
