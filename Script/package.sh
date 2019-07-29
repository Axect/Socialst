# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib npm \
    julia sagemath dlang pandoc pandoc-citeproc \
    zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting \
    youtube-dl sagemath-jupyter fd tree\
    ttf-fira-code ttf-ubuntu-font-family

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
        pdfsam gscan2pdf \
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

echo "Install ROOT jupyter kernel.."
cp -r $HOME/.rootnb/kernels/root $HOME/.local/share/jupyter/kernels/./
echo "Successfully installed!"

# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ $aur = "y" ]; then
    yay -S --noconfirm --needed \
        slack-desktop ttf-nanum \
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
