#!/bin/sh
# XFCE config setup - symlink keyboard shortcuts, xfwm4, session
# Provides i3-like keybindings (Super+1..9 workspaces, Super+arrows tile,
# Super+Return ghostty, Super+d appfinder) on top of plain xfwm4.
SOCIALST="$HOME/Socialst"
XFCE_SRC="$SOCIALST/XFCE"
XFCE_DST="$HOME/.config/xfce4/xfconf/xfce-perchannel-xml"

# Ensure destination directory exists
if [ ! -d "$XFCE_DST" ]; then
	mkdir -p "$XFCE_DST"
fi

for f in xfce4-keyboard-shortcuts.xml xfwm4.xml xfce4-session.xml; do
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
echo "XFCE setup complete!"
echo "Log out and back in to apply (xfwm4 will replace i3 as the WM)."
