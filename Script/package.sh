# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib npm \
    julia sagemath dlang pandoc pandoc-citeproc \
    zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting \
    youtube-dl ffmpeg sagemath-jupyter fd tree \
    ttf-fira-code ttf-ubuntu-font-family ttf-cascadia-code \
    system-config-printer cups hplip \
    powerline powerline-fonts ncdu \
    netcdf python-netcdf4 \
    the_silver_searcher \
    cmake

echo "Do you want to install packages for Linux laptop?"
read laptop

if [ $laptop = "y" ]; then
    echo "Install packages for laptop"
    yay -S --noconfirm --needed \
        open-vm-tools \
        chrome-gnome-shell \
        synapse

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
        cmus filezilla easytag flameshot \
        eog pdfsam gscan2pdf \
        code imagewriter
elif [ $common = "n" ]; then
    echo "Skip common programs"
fi
  
# HEP
echo "Do you want to install High energy physics related programs? [y/n]"
read hep

if [ $hep = "y" ]; then
    echo "Install HEP programs"
    yay -S --noconfirm --needed \
        root \
        hepmc \
        fastjet \
        pythia8 \
        cern-vdt \
        lhapdf
elif [ $hep = "n" ]; then
    echo "Skip hep programs"
fi

# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ $aur = "y" ]; then
    yay -S --noconfirm --needed \
        slack-desktop ttf-nanum \
        la-capitaine-icon-theme \
	    mailspring \
        ncview \
        youtube-dl-gui-git \
        gnome-terminal-transparency \
        masterpdfeditor \
        vmware-workstation \
        typora \
        megasync megatools \
        gitkraken \
        onlyoffice-bin
elif [ $aur = "n" ]; then
    echo "Skip AUR"
fi

