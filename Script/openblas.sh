export RUSTLIB="$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/x86_64-unknown-linux-gnu/lib"

ln -s /opt/OpenBLAS/lib/libopenblas.so $RUSTLIB/libopenblas.so
ln -s /opt/OpenBLAS/lib/libopenblas.so.0 $RUSTLIB/libopenblas.so.0
ln -s /opt/OpenBLAS/lib/libopenblas.a $RUSTLIB/libopenblas.a
