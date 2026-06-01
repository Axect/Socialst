#!/bin/sh
# Typora whitey theme setup - symlink whitey.css from Socialst and stage fonts.
# Existing real files/dirs are backed up to .old before linking.
SOCIALST="$HOME/Socialst"
TYPORA_THEMES="$HOME/.config/Typora/themes"
CSS_SRC="$SOCIALST/Typora/whitey2.css"
CSS_DST="$TYPORA_THEMES/whitey.css"
FONT_DIR="$TYPORA_THEMES/whitey"

if [ ! -d "$TYPORA_THEMES" ]; then
	mkdir -p "$TYPORA_THEMES"
fi

if [ ! -f "$CSS_SRC" ]; then
	echo "Source missing: $CSS_SRC" >&2
	exit 1
fi

if [ -L "$CSS_DST" ]; then
	rm "$CSS_DST"
elif [ -f "$CSS_DST" ]; then
	echo "Backup whitey.css to whitey.css.old"
	mv "$CSS_DST" "${CSS_DST}.old"
fi

ln -s "$CSS_SRC" "$CSS_DST"
echo "Linked whitey.css"

if [ -L "$FONT_DIR" ]; then
	rm "$FONT_DIR"
elif [ -d "$FONT_DIR" ]; then
	echo "Backup whitey/ to whitey.old"
	mv "$FONT_DIR" "${FONT_DIR}.old"
fi

mkdir -p "$FONT_DIR"
cp "$SOCIALST"/Typora/*.otf "$FONT_DIR"/
echo "Staged fonts into whitey/"

echo ""
echo "Typora whitey theme setup complete!"
