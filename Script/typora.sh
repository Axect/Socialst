export SOCIALST=$HOME/Socialst
export TYPORA=$HOME

rm $TYPORA/.config/Typora/themes/whitey.css
ln -s $SOCIALST/Typora/whitey2.css $TYPORA/.config/Typora/themes/whitey.css
mkdir $TYPORA/.config/Typora/themes/whitey
cp $SOCIALST/Typora/*.otf $TYPORA/.config/Typora/themes/whitey
