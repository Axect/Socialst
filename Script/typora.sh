export SOCIALST=$HOME/Socialst

rm $HOME/.config/Typora/themes/whitey.css
ln -s $SOCIALST/Typora/whitey.css $HOME/.config/Typora/themes/whitey.css
mkdir $HOME/.config/Typora/themes/whitey
cp $SOCIALST/Typora/*.woff $HOME/.config/Typora/themes/whitey
