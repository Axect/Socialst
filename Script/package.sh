# Official Repository
## Necessary
echo "Install Necessary programs"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib npm zathura-ps zathura-pdf-poppler zathura-djvu zathura-cb \
    julia sagemath dlang pandoc pandoc-citeproc \
    zsh-history-substring-search zsh-autosuggestions lsb-release \
    youtube-dl sagemath-jupyter fd\

## Common Programs
echo "Do you want to install common programs in Official Repo? [y/n]"
read common

if [ $common -eq "y" ]; then
    echo "Install common programs"
    yay -S --noconfirm --needed \
        uim \
        zathura-ps zathura-pdf-poppler zathura-djvu zathura-cb \
        cmus \
        filezilla \
        easytag \
        flameshot \
        shotwell
elif [ $common -eq "n" ]; then
    echo "Skip common programs"
fi
  
# AUR
echo "Do you want to install common programs in AUR> [y/n]"
read aur

if [ $aur -eq "y" ]; then
    yay -S --noconfirm --needed \
        slack-desktop grive ttf-nanum \
        acroread \
        hiri \
        insync
elif [ $aur -eq "n" ]; then
    echo "Skip AUR"
fi

# Rust
echo "Start setting Rust"
curl https://sh.rustup.rs -sSf | sh

# Nim
echo "Start setting Nim"
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
