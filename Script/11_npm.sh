# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Clean up old npm global prefix (incompatible with NVM)
npm config delete prefix 2>/dev/null

# Install Node.js via NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --delete-prefix --lts
nvm alias default lts/*

# Install nvm.fish plugin for fish shell (run in fish)
fish -c "fisher install jorgebucaran/nvm.fish"

# Set default NVM version for fish shell
fish -c "set -U nvm_default_version lts"
