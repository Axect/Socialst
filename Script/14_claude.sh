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

# Skills
SKILLS_SRC="$CC_DIR/skills"
SKILLS_DST="$CLAUDE_DIR/skills"

if [ -d "$SKILLS_SRC" ]; then
	mkdir -p "$SKILLS_DST"
	for skill_dir in "$SKILLS_SRC"/*/; do
		skill_name=$(basename "$skill_dir")
		if [ -L "$SKILLS_DST/$skill_name" ]; then
			rm "$SKILLS_DST/$skill_name"
		elif [ -d "$SKILLS_DST/$skill_name" ]; then
			echo "Backup skills/$skill_name to skills/${skill_name}.old"
			mv "$SKILLS_DST/$skill_name" "$SKILLS_DST/${skill_name}.old"
		fi
		ln -s "$skill_dir" "$SKILLS_DST/$skill_name"
		echo "Linked skill: $skill_name"
	done
fi

echo "Claude Code setup complete!"
