#!/bin/sh

echo "Updating repos"
sudo pacman -Syyu --noconfirm

# aura-bin dependency
sudo pacman -S --noconfirm --needed curl

if [[ ! $(command -v aura) ]]
then
    echo "Installing Aura"
    cd /tmp
    curl https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=aura-bin > PKGBUILD
    makepkg
    echo Y | sudo pacman -U aura-bin/aura-bin*.tar.xz
    cd -
fi

sudo aura -Axuy --noconfirm

echo "Installing basic packages"
sudo pacman -S --noconfirm --needed \
     xorg-server \
     xorg-xinit \
     xorg-xrdb \
     xorg-xmodmap \
     xf86-input-libinput \
     slim \
     systemd \
     openssh \
     sysstat

echo "Installing wireless packages"
sudo pacman -S --noconfirm --needed \
     wpa_supplicant \
     netctl \
     networkmanager \
     network-manager-applet

echo "Installing sound packages"
sudo pacman -S --noconfirm --needed \
     pulseaudio \
     pavucontrol

echo "Installing fonts"
sudo pacman -S --noconfirm --needed \
     ttf-dejavu \
     terminus-font \
     noto-fonts-cjk \
     noto-fonts-emoji \
     xorg-fonts-misc

sudo aura -Ax --noconfirm --needed \
    ttf-font-awesome-4 \
    ttf-nanum

echo "Installing basic tools"
sudo pacman -S --noconfirm --needed \
     rsync \
     ntp \
     ripgrep \
     xsel \
     unzip \
     unrar \
     imagemagick \
     bash-completion \
     alsa-utils \
     redshift \
     tk \
     zsh-history-substring-search \
     zsh-autosuggestions \
     lsb-release \
     uim \
     zathura-pdf-poppler \
     zathura-djvu \
     zathura-cb

echo "Installing development tools"
sudo pacman -S --noconfirm --needed \
     base-devel \
     git \
     tmux \
     pandoc \
     pandoc-citeproc \
     gcc-fortran \
     npm

sudo aura -Ax --noconfirm --needed \
    byobu \


echo "Installing languages"
sudo pacman -S --noconfirm --needed \
     ruby \
     python \
     python2 \
     go \
     elixir \
     dlang \
     julia \
     sagemath \
     sagemath-jupyter
     rustup

echo "Essential python packages"
sudo pacman -S --noconfirm --needed \
    python-numpy \
    python-scipy \
    python-matplotlib \
    python-pip \
    jupyter-notebook

echo "Preparing Rust language"
rustup install nightly
rustup default nightly
rustup component add rustfmt-preview
rustup component add clippy-preview
cargo +nightly install racer -q

echo "Docker"
sudo pacman -S --noconfirm --needed \
     docker \
     docker-compose

echo "Installing editors"
sudo pacman -S --noconfirm --needed \
     vim

echo "Installing xfce4"
sudo pacman -S --noconfirm --needed \
     xfce4 \
     xfce4-goodies \
     mupdf \
     file-roller \
     gvfs

sudo aura -Ax --noconfirm --needed \
     sardi-icons \
     xfwm-axiom-theme \
     xfce4-hardware-monitor-plugin

echo "Installing i3/sway"
sudo pacman -S --noconfirm --needed \
     i3-wm \
     i3lock \
     i3status \
     sway \
     rxvt-unicode

sudo aura -Ax --noconfirm --needed i3blocks

echo "Installing common software"
sudo pacman -S --noconfirm --needed \
     inkscape \
     texlive-most \
     texlive-lang
     dos2unix \
     shotwell \
     tmux \
     keybase \
     audacity \
     transmission-gtk \
     peek \
     cmus \
     filezilla \
     easytag

sudo aura -Ax --noconfirm --needed \
     tmate \
     dropbox \
     zoom \
     insync \
     slack-desktop \
     acroread \
     hiri

echo "Installing video software"
sudo pacman -S --noconfirm --needed \
     vlc \
     obs-studio

echo "Installing browsers"
sudo pacman -S --noconfirm --needed firefox
sudo aura -Ax --noconfirm --needed google-chrome-dev

echo "Installing productivity related software"
sudo aura -A  --noconfirm --needed \
     rescuetime \
     toggldesktop-bin

echo "Installing kernel flavors"
sudo pacman -S --noconfirm --needed linux-zen linux-zen-headers
sudo pacman -S --noconfirm --needed linux-headers

echo "Laptop improvements (mostly thinkpad specifics)"
sudo pacman -S --noconfirm --needed \
     acpid \
     tlp \
     smartmontools \
     ethtool \
     acpi_call

echo "Install virtualization software"
sudo pacman -S --noconfirm --needed \
    virtualbox \
    virtualbox-host-modules-arch

echo "Activate needed services"
sudo systemctl enable ntpd.service
sudo systemctl enable NetworkManager.service
sudo systemctl enable acpid.service
sudo systemctl enable nscd.service

exit 0
