cd $HOME/zbin
git clone https://github.com/Axect/JuliaDocker
cd -
cd $HOME/zbin/JuliaDocker
sh build.sh
sh run.sh $HOME/workspace/julia_sci
cd -

mkdir $HOME/.zsh_fn
ln -s $HOME/Socialst/Zsh/julia.zsh $HOME/.zsh_fn/julia.zsh
