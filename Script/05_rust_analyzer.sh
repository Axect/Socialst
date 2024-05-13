#if [ -d "$HOME/zbin" ]; then
#    cd $HOME/zbin
#else
#    mkdir $HOME/zbin
#    mkdir $HOME/zlib
#    cd $HOME/zbin
#fi
#
#cd $HOME/zbin
#git clone https://github.com/rust-analyzer/rust-analyzer && cd rust-analyzer
#cargo xtask install
#cd $HOME/Socialst/Script
rustup component add rust-analyzer
