# Official Repository
## Necessary
echo "Install Necessary programs for CLI environment"
yay -S --needed \
  texlive texlive-lang tk gcc-fortran jupyter-notebook \
  python-pip python-numpy python-scipy python-matplotlib python-pandas npm pandoc \
  sagemath sagetex sagemath-doc \
  fish fzf \
  ffmpeg tree htop ttf-fira-code ttf-ubuntu-font-family ttf-cascadia-code \
  system-config-printer cups hplip \
  foot \
  netcdf python-netcdf4 \
  wl-clipboard \
  cmake gdb clang \
  neovim python-neovim \
  ttf-liberation noto-fonts noto-fonts-emoji noto-fonts-extra \
  ttf-jetbrains-mono noto-fonts-cjk \
  git-lfs jupyterlab \
  hugo zola \
  lld sccache mold \
  valgrind fmt \
  docker docker-compose \
  alsa-lib libglvnd \
  p7zip \
  broot bottom \
  github-cli \
  glow lazygit git-delta \
  jupyter-console python-pyarrow \
  python-pipx \
  fd ncdu bat dust hyperfine zoxide sd tokei tealdeer eza btop \
  gping ripgrep curlie nerd-fonts \
  python-black \
  chafa \
  tectonic \
  solaar \
  helix bash-language-server julia python-lsp-server rust-analyzer texlab \
  ttf-ibm-plex yt-dlp python-scienceplots ttf-times-new-roman \
  pyright eslint \
  impression pdf2svg \
  fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-hangul
# sagemath-jupyter
# pandoc-citeproc
#julia-bin \

echo "Do you want to install packages for Linux laptop?"
read laptop

if [ "$laptop" = "y" ]; then
  echo "Install packages for laptop"
  yay -S --noconfirm --needed \
    okular audacious easytag \
    gnome-keyring telegram-desktop filezilla \
    typst sof-firmware \
    zed \
    pdfarranger pdfsam \
    simplescreenrecorder \
    unison \
    otf-stix
  #kitty
  #zathura-ps zathura-pdf-mupdf zathura-djvu zathura-cb \
  #gscan2pdf \
  #synapse foliate \
  #mdbook img2pdf \
  #imagewriter
  #gnome-tweaks \
  #chrome-gnome-shell \
  #vivaldi vivaldi-ffmpeg-codecs
  #firefox-developer-edition firefox-developer-edition-i18n-ko \
  #uim
elif [ "$laptop" = "n" ]; then
  echo "Skip laptop packages"
fi

# HEP
echo "Do you want to install High energy physics related programs? [y/n]"
read hep

if [ "$hep" = "y" ]; then
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
    python-h5py
  #python-astropy \
elif [ "$hep" = "n" ]; then
  echo "Skip hep programs"
fi

# AUR
echo "Do you want to install common programs in AUR? [y/n]"
read aur

if [ "$aur" = "y" ]; then
  yay -S --noconfirm --needed \
    slack-desktop ttf-nanum \
    insync \
    gitkraken \
    typora \
    visual-studio-code-bin \
    masterpdfeditor \
    zoom \
    microsoft-edge-beta-bin \
    mathpix-snipping-tool \
    drawio-desktop-bin \
    mochi-appimage \
    gromit-mpx-git \
    localsend-bin \
    bibtex-tidy \
    dropbox
  #weylus-bin \
  #ncview \
  #google-chrome-beta \
  #notion-app \
  #minetime \
  #insync-nautilus \
  #edex-ui-bin
  #onlyoffice-bin \
  #gnome-terminal-transparency \
  #youtube-dl-gui-git \
elif [ "$aur" = "n" ]; then
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
