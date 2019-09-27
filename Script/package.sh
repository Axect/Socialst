# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib npm \
    julia sagemath dlang pandoc pandoc-citeproc \
    zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting \
    youtube-dl sagemath-jupyter fd tree\
    ttf-fira-code ttf-ubuntu-font-family \
    system-config-printer cups hplip \
    powerline powerline-fonts ncdu

echo "Do you want to install packages for Linux laptop?"
read laptop

if [ $laptop = "y" ]; then
    echo "Install packages for laptop"
    yay -S --noconfirm --needed \
        la-capitaine-icon-theme \
        open-vm-tools
elif [ $laptop = "n" ]; then
    echo "Skip laptop packages"
fi

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
        eog \
        pdfsam gscan2pdf
elif [ $common = "n" ]; then
    echo "Skip common programs"
fi
  
# HEP
echo "Do you want to install High energy physics related programs? [y/n]"
read hep

if [ $common = "y" ]; then
    echo "Install HEP programs"
    yay -S --noconfirm --needed \
        root \
        hepmc \
        fastjet \
        pythia8 \
        cern-vdt \
        lhapdf
elif [ $common = "n" ]; then
    echo "Skip hep programs"
fi

# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ $aur = "y" ]; then
    yay -S --noconfirm --needed \
        slack-desktop ttf-nanum ttf-cascadia-code \
	    mailspring \
        pcloud-drive \
        youtube-dl-gui-git \
        gnome-terminal-transparency \
        masterpdfeditor \
        vmware-workstation \
        typora miniconda3
elif [ $aur = "n" ]; then
    echo "Skip AUR"
fi

# Rust
echo "Start setting Rust"
curl https://sh.rustup.rs -sSf | sh
