cd $HOME/zbin
git clone https://github.com/xianyi/OpenBLAS
cd OpenBLAS
make
sudo make install

export RUSTLIB="$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"

ln -s /opt/OpenBLAS/lib/libopenblas.so $RUSTLIB/libopenblas.so
ln -s /opt/OpenBLAS/lib/libopenblas.so.0 $RUSTLIB/libopenblas.so.0
ln -s /opt/OpenBLAS/lib/libopenblas.a $RUSTLIB/libopenblas.a
