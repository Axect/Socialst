# Make ~/zbin directory if it doesn't exist
if [ ! -d ~/zbin ]; then
    mkdir ~/zbin
fi

# Install base-devel if not already installed
sudo pacman -S --needed base-devel

# Install paru
git clone https://aur.archlinux.org/paru.git ~/zbin/paru
cd ~/zbin/paru
makepkg -si

# return back
cd -
