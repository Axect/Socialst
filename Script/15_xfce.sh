#!/bin/sh
# XFCE config setup - manage keyboard shortcuts, xfwm4, session via symlinks.
# Provides i3-like keybindings (Super+1..9 workspaces, Super+arrows tile,
# Super+Return ghostty, Super+d appfinder) on top of plain xfwm4.
#
# Usage:
#   15_xfce.sh [deploy]   Socialst -> ~/.config (symlink, backs up to .old)
#   15_xfce.sh pull       ~/.config -> Socialst (recover changes, re-link)
#
# Why pull? xfconfd writes via atomic-rename, which clobbers symlinks into
# regular files. Run `pull` after changing settings via the XFCE settings
# panel or xfconf-query to sync edits back to Socialst and re-establish
# the symlinks.
SOCIALST="$HOME/Socialst"
XFCE_SRC="$SOCIALST/XFCE"
XFCE_DST="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"
FILES="xfce4-keyboard-shortcuts.xml xfwm4.xml xfce4-session.xml"

MODE="${1:-deploy}"

deploy() {
	if [ ! -d "$XFCE_DST" ]; then
		mkdir -p "$XFCE_DST"
	fi

	for f in $FILES; do
		src="$XFCE_SRC/$f"
		dst="$XFCE_DST/$f"

		if [ ! -f "$src" ]; then
			echo "Skip $f (source missing: $src)"
			continue
		fi

		if [ -L "$dst" ]; then
			rm "$dst"
		elif [ -f "$dst" ]; then
			echo "Backup $f to ${f}.old"
			mv "$dst" "${dst}.old"
		fi

		ln -s "$src" "$dst"
		echo "Linked $f"
	done

	echo ""
	echo "XFCE deploy complete!"
	echo "Log out and back in to apply (xfwm4 will replace i3 as the WM)."
}

pull() {
	if [ ! -d "$XFCE_SRC" ]; then
		mkdir -p "$XFCE_SRC"
	fi

	changed=0
	for f in $FILES; do
		src="$XFCE_SRC/$f"
		dst="$XFCE_DST/$f"

		if [ ! -e "$dst" ]; then
			echo "Skip $f (not present at $dst)"
			continue
		fi

		if [ -L "$dst" ]; then
			echo "$f: already a symlink, skipping"
			continue
		fi

		cp "$dst" "$src"
		rm "$dst"
		ln -s "$src" "$dst"
		echo "$f: synced to Socialst and re-linked"
		changed=$((changed + 1))
	done

	echo ""
	echo "XFCE pull complete ($changed file(s) updated)."
}

case "$MODE" in
	deploy) deploy ;;
	pull)   pull ;;
	*)
		echo "Usage: $0 [deploy|pull]" >&2
		exit 1
		;;
esac
