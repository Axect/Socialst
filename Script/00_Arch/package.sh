# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
paru -S --noconfirm --needed \
    texlive-most texlive-lang tk gcc-fortran r jupyter-notebook \
    python-pip python-numpy python-scipy python-matplotlib python-pandas\
    npm dlang pandoc gvim \
    sagemath sagetex sagemath-doc \
    zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting \
    zsh-completions fzf \
    youtube-dl ffmpeg fd tree htop\
    ttf-fira-code ttf-ubuntu-font-family ttf-cascadia-code \
    system-config-printer cups hplip \
    powerline powerline-fonts ncdu \
    netcdf python-netcdf4 \
    the_silver_searcher \
    cmake gdb clang \
    neovim python-neovim xclip \
    ttf-liberation noto-fonts noto-fonts-emoji noto-fonts-extra \
    ttf-jetbrains-mono noto-fonts-cjk \
    git-lfs jupyterlab \
    exa btop \
    hugo \
    lld sccache \
    hyperfine bat dust sd zoxide tokei tealdeer \
    valgrind fmt \
    docker docker-compose \
    libxau libxi libxss libxtst libxcursor libxcomposite libxdamage libxfixes\
    libxrandr libxrender mesa-libgl  alsa-lib libglvnd \
    p7zip \
    broot bottom zellij screen \
    github-cli \
    glow lazygit git-delta
    # sagemath-jupyter
    # pandoc-citeproc
    #julia-bin \

echo "Do you want to install packages for Linux laptop?"
read laptop

if [ $laptop = "y" ]; then
    echo "Install packages for laptop"
    paru -S --noconfirm --needed \
        okular pdfsam gscan2pdf easytag filezilla \
        zathura-ps zathura-pdf-mupdf zathura-djvu zathura-cb \
        synapse foliate \
        audacious \
        simplescreenrecorder \
        sof-firmware \
        mdbook \
        pdfarranger img2pdf \
        gnome-keyring \
        telegram-desktop \
        kime \
        thunderbird-i18n-ko \
        typst kitty
	#imagewriter
        #gnome-tweaks \
        #chrome-gnome-shell \
        #vivaldi vivaldi-ffmpeg-codecs
        #firefox-developer-edition firefox-developer-edition-i18n-ko \
	#uim
elif [ $laptop = "n" ]; then
    echo "Skip laptop packages"
fi

# HEP
echo "Do you want to install High energy physics related programs? [y/n]"
read hep

if [ $hep = "y" ]; then
    echo "Install HEP programs"
    paru -S --noconfirm --needed \
        root \
        hepmc \
        fastjet \
        pythia8 \
        cern-vdt \
        lhapdf \
        cython \
        python-wheel \
        python-h5py
        #python-astropy \
elif [ $hep = "n" ]; then
    echo "Skip hep programs"
fi

# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ $aur = "y" ]; then
    paru -S --noconfirm --needed \
        slack-desktop ttf-nanum \
        la-capitaine-icon-theme \
        youtube-dl-gui-git \
        insync \
        gitkraken \
        typora \
        visual-studio-code-bin \
        masterpdfeditor \
        zoom \
	    microsoft-edge-beta-bin \
        weylus-bin \
        ncview \
        birdtray \
        mathpix-snipping-tool \
        trilium-bin \
        drawio-desktop-bin \
        hoffice \
        mochi-appimage
        #google-chrome-beta \
        #notion-app \
        #minetime \
        #insync-nautilus \
        #edex-ui-bin
        #onlyoffice-bin \
        #gnome-terminal-transparency \
elif [ $aur = "n" ]; then
    echo "Skip AUR"
fi
## VMware
#echo "Do you want to install vmware? [y/n]"
#read vm
#
#if [ $vm = "y" ]; then
#    yay -S --noconfirm --needed \
#        open-vm-tools \
#        vmware-workstation
#elif [ $vm = "n" ]; then
#    echo "Skip VMware"
#fi
