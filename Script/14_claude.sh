#!/bin/sh
# Claude Code config setup - symlink settings.json and CLAUDE.md
SOCIALST="$HOME/Socialst"
CC_DIR="$SOCIALST/CC"
CLAUDE_DIR="$HOME/.claude"

# Ensure ~/.claude directory exists
if [ ! -d "$CLAUDE_DIR" ]; then
	mkdir -p "$CLAUDE_DIR"
fi

# settings.json
if [ -f "$CLAUDE_DIR/settings.json" ]; then
	echo "Backup settings.json to settings.json.old"
	mv "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.old"
fi
ln -s "$CC_DIR/settings.json" "$CLAUDE_DIR/settings.json"
echo "Linked settings.json"

# CLAUDE.md
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
	echo "Backup CLAUDE.md to CLAUDE.md.old"
	mv "$CLAUDE_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md.old"
fi
ln -s "$CC_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
echo "Linked CLAUDE.md"

echo "Claude Code setup complete!"
