export SOCIALST=$HOME/Socialst

rm $HOME/.config/Typora/themes/whitey.css
ln -s $SOCIALST/Typora/whitey2.css $HOME/.config/Typora/themes/whitey.css
mkdir $HOME/.config/Typora/themes/whitey
cp $SOCIALST/Typora/*.otf $HOME/.config/Typora/themes/whitey
