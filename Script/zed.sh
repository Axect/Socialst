# Check if zed settings file exists
# If it does and is not symbolic-link, then backup the file
if [ -f $HOME/.config/zed/settings.json ] && [ ! -L $HOME/.config/zed/settings.json ]; then
    echo "Backing up existing settings.json to settings.json.bak"
    cp $HOME/.config/zed/settings.json $HOME/.config/zed/settings.json.bak
fi

# If there is symbolic-link already, skip the creation
# Else, create a symbolic-link to the settings.json file in the Socialst directory
if [ -L $HOME/.config/zed/settings.json ]; then
    echo "Symbolic-link already exists, skipping creation."
else
    echo "Creating symbolic-link to settings.json"
    mkdir -p $HOME/.config/zed
    ln -s $HOME/Socialst/Zed/settings.json $HOME/.config/zed/settings.json
fi
