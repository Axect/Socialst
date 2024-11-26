# Make ~/zbin directory if it doesn't exist
if [ ! -d ~/zbin ]; then
    mkdir ~/zbin
fi

# Install base-devel if not already installed
sudo pacman -S --needed base-devel

# Install yay
git clone https://aur.archlinux.org/yay.git ~/zbin/yay
cd ~/zbin/yay
makepkg -si

# return back
cd -
