if [ -d "$HOME/zbin" ]; then
    cd $HOME/zbin
else
    mkdir $HOME/zbin
    cd $HOME/zbin
fi

cd $HOME/zbin
git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
cargo xtask install
cd $HOME/Socialst/Script