# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
yay -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib python-pandas\
    npm sagemath dlang pandoc pandoc-citeproc gvim \
    zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting \
    zsh-completions fzf \
    youtube-dl ffmpeg sagemath-jupyter fd tree htop\
    ttf-fira-code ttf-ubuntu-font-family ttf-cascadia-code \
    system-config-printer cups hplip \
    powerline powerline-fonts ncdu \
    netcdf python-netcdf4 \
    the_silver_searcher \
    cmake gdb clang \
    neovim python-neovim xclip \
    ttf-liberation noto-fonts noto-fonts-emoji noto-fonts-extra \
    ttf-jetbrains-mono \
    git-lfs jupyterlab \
    bashtop exa \
    hugo \
    lld sccache \
    hyperfine bat dust sd zoxide-bin tokei tealdeer \
    kime-bin \
    julia-bin valgrind

echo "Do you want to install packages for Linux laptop?"
read laptop

if [ $laptop = "y" ]; then
    echo "Install packages for laptop"
    yay -S --noconfirm --needed \
        okular imagewriter pdfsam gscan2pdf easytag filezilla \
        zathura-ps zathura-pdf-mupdf zathura-djvu zathura-cb \
        synapse uim foliate \
        firefox-developer-edition firefox-developer-edition-i18n-ko \
        audacious \
        simplescreenrecorder \
        sof-firmware \
        peazip-gtk2-bin \
        mdbook \
        pdfarranger img2pdf \
        photoqt
        #gnome-tweaks \
        #chrome-gnome-shell \
        #vivaldi vivaldi-ffmpeg-codecs
elif [ $laptop = "n" ]; then
    echo "Skip laptop packages"
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
        lhapdf \
        cython \
        python-wheel \
        python-astropy \
        python-h5py
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
        youtube-dl-gui-git \
        insync \
        gitkraken \
        notion-app \
        typora \
        visual-studio-code-bin \
        minetime \
        masterpdfeditor \
        zoom \
        google-chrome-beta
        #mailspring
        #insync-nautilus \
        #edex-ui-bin
        #onlyoffice-bin \
        #gnome-terminal-transparency \
        #ncview \
elif [ $aur = "n" ]; then
    echo "Skip AUR"
fi

# VMware
echo "Do you want to install vmware? [y/n]"
read vm

if [ $vm = "y" ]; then
    yay -S --noconfirm --needed \
        open-vm-tools \
        vmware-workstation
elif [ $vm = "n" ]; then
    echo "Skip VMware"
fi
