# Official Repository
## Necessary
echo "Install Necessary programs"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib npm \
    julia sagemath dlang pandoc pandoc-citeproc \
    zsh-history-substring-search zsh-autosuggestions \
    youtube-dl sagemath-jupyter fd tree\
    ttf-fira-code ttf-ubuntu-font-family\
    la-capitane-icon-theme

## Common Programs
echo "Do you want to install common programs in Official Repo? [y/n]"
read common

if [ $common = "y" ]; then
    echo "Install common programs"
    yay -S --noconfirm --needed \
        uim \
        zathura-ps zathura-pdf-poppler zathura-djvu zathura-cb \
        cmus \
        filezilla \
        easytag \
        flameshot \
        shotwell
elif [ $common = "n" ]; then
    echo "Skip common programs"
fi
  
# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ $aur = "y" ]; then
    yay -S --noconfirm --needed \
        slack-desktop ttf-nanum \
        hiri \
        pcloud-drive \
        youtube-dl-gui-git \
        gnome-terminal-transparency
elif [ $aur = "n" ]; then
    echo "Skip AUR"
fi

# MATLAB
echo "Do you want to install matlab jupyter kernel? [y/n]"
read mlab

if [ $mlab = "y" ]; then
    echo "Install matlab jupyter kernel..."
    yay -S --noconfirm --needed \
        matlab-engine-for-python
    pip install --user matlab_kernel
fi

# Rust
echo "Start setting Rust"
curl https://sh.rustup.rs -sSf | sh

# Nim
echo "Start setting Nim"
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
