echo "Install matlab jupyter kernel..."
yay -S --noconfirm --needed \
    matlab-engine-for-python
pip install --user matlab_kernel

