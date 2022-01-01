cd $HOME/zbin
git clone https://github.com/Axect/JuliaDocker
cd -
cd $HOME/zbin/JuliaDocker
sh build.sh
sh run.sh $HOME
cd -

mkdir $HOME/.zsh_fn
cp $HOME/Socialst/Zsh/julia.zsh $HOME/.zsh_fn/julia.zsh
