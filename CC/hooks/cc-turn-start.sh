#!/bin/bash
# Records the wall-clock start time of a user turn, keyed by session id.
# Wired to the UserPromptSubmit hook. Read by cc-notify.sh to decide whether
# a completed-turn notification is worth firing (long task vs quick reply).

set -u

INPUT="$(cat 2>/dev/null || true)"
SID="$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null || true)"
[ -z "$SID" ] && SID="default"

STAMP_DIR="${TMPDIR:-/tmp}/cc-notify"
mkdir -p "$STAMP_DIR" 2>/dev/null || true
date +%s >"$STAMP_DIR/turn-${SID}.start" 2>/dev/null || true

exit 0
