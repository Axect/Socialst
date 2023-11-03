#!/bin/sh
SOCIALST="$HOME/Socialst"
AXECT="https://github.com/Axect"

# Socialst
if [ ! -d "$SOCIALST" ]; then
	cd $HOME
	git clone "${AXECT}/Socialst"
fi

# zshrc
echo "What kinds of zsh do you want to use?"
echo "1. Custom zsh, 2. oh-my-zsh, 3. skip"

read choose_zsh

if [ $choose_zsh -eq 1 ]; then
	if [ ! -d "$HOME/.zshrc" ]; then
		echo "Create .zshrc file"
	else
		echo "Backup original .zshrc to .zshrc.old"
		mv $HOME/.zshrc $HOME/.zshrc.old
	fi
	ln -s $SOCIALST/Zsh/.zshrc $HOME/.zshrc
	chsh -s $(which zsh)
	echo "Complete zsh Setup!"
elif [ $choose_zsh -eq 2 ]; then
	if [ -d "$HOME/.zshrc" ]; then
		echo "Backup original .zshrc to .zshrc.old"
		mv $HOME/.zshrc $HOME/.zshrc.old
	fi
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	ln -s $SOCIALST/Zsh/ohmyzshrc $HOME/.zshrc
	echo "Complete zsh Setup!"
else
	echo "Skip zsh Setup!"
fi

# Spacevim
echo "What kinds of vim do you want to use?"
echo "1. Vim, 2. Spacevim, 3. Neovim, 4. Lazyvim, 5. Skip"

read vim

if [ $vim -eq 2 ]; then
	if [ ! -d "$HOME/.SpaceVim" ]; then
		curl -sLf https://spacevim.org/install.sh | bash
		mkdir $HOME/.SpaceVim.d
		ln -s $SOCIALST/SpaceVim/init.toml $HOME/.SpaceVim.d/init.toml
		echo "Complete spacevim Setup!"
	fi
elif [ $vim -eq 1 ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	ln -s $SOCIALST/Vim/.vimrc $HOME/.vimrc
	echo "Complete vim setup!"
elif [ $vim -eq 3 ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	if [ ! -d "$HOME/.config/nvim" ]; then
		mkdir $HOME/.config/nvim
	fi
	ln -s $SOCIALST/NeoVim/init.vim $HOME/.config/nvim/init.vim
	ln -s $SOCIALST/NeoVim/coc-settings.json $HOME/.config/nvim/coc-settings.json
	ln -s $SOCIALST/NeoVim/.vsnip $HOME/.vsnip
	echo "Complete to setup neovim"
elif [ $vim -eq 4 ]; then
    # Check .config/nvim & backup
    if [ -d "$HOME/.config/nvim" ]; then
        echo "Backup original .config/nvim to .config/nvim.old"
        mv $HOME/.config/nvim $HOME/.config/nvim.old
    fi
    # Check .vim & backup
    if [ -d "$HOME/.vim" ]; then
        echo "Backup original .vim to .vim.old"
        mv $HOME/.vim $HOME/.vim.old
    fi
    # Check .vimrc & backup
    if [ -d "$HOME/.vimrc" ]; then
        echo "Backup original .vimrc to .vimrc.old"
        mv $HOME/.vimrc $HOME/.vimrc.old
    fi
    # Check .local/share/nvim & backup
    if [ -d "$HOME/.local/share/nvim" ]; then
        echo "Backup original .local/share/nvim to .local/share/nvim.old"
        mv $HOME/.local/share/nvim $HOME/.local/share/nvim.old
    fi
    # Check .local/state/nvim & backup
    if [ -d "$HOME/.local/state/nvim" ]; then
        echo "Backup original .local/state/nvim to .local/state/nvim.old"
        mv $HOME/.local/state/nvim $HOME/.local/state/nvim.old
    fi
    # Check .cache/nvim & backup
    if [ -d "$HOME/.cache/nvim" ]; then
        echo "Backup original .cache/nvim to .cache/nvim.old"
        mv $HOME/.cache/nvim $HOME/.cache/nvim.old
    fi
	git clone https://github.com/Axect/lazyvim_template ~/.config/nvim
else
	echo "Skip vim setup!"
fi

# Eisvogel
if [ ! -d "$HOME/.pandoc" ]; then
	mkdir -p $HOME/.pandoc/templates
	ln -s $SOCIALST/Pandoc/eisvogel.latex $HOME/.pandoc/templates/eisvogel.latex
	echo "Complete Eisvogel Setup!"
fi

# Zathura
if [ ! -d "$HOME/.config/zathura" ]; then
	mkdir -p "$HOME/.config/zathura"
	ln -s $SOCIALST/Zathura/zathurarc $HOME/.config/zathura/zathurarc
fi

# Xprofile
echo "What kinds of input method do you want to use?"
echo "1. ibus, 2. uim, 3. kime, 4. skip"

read input_method

if [ $input_method -eq 1 ]; then
	if [ ! -d "$HOME/.xprofile" ]; then
		ln -s $SOCIALST/IBUS/xprofile $HOME/.xprofile
	fi
elif [ $input_method -eq 2 ]; then
	if [ ! -d "$HOME/.xprofile" ]; then
		ln -s $SOCIALST/UIM/xprofile $HOME/.xprofile
	fi
elif [ $input_method -eq 3 ]; then
	if [ ! -d "$HOME/.xprofile" ]; then
		ln -s $SOCIALST/KIME/xprofile $HOME/.xprofile
	fi
	if [ ! -d "$HOME/.config/kime" ]; then
		mkdir $HOME/.config/kime
	fi
	ln -s $SOCIALST/KIME/config.yaml $HOME/.config/kime/config.yaml
else
	echo "Skip input method setup"
fi

# Zellij
if [ ! -d "$HOME/.config/zellij" ]; then
	mkdir -p "$HOME/.config/zellij"
fi
ln -s $SOCIALST/Zellij/config.kdl $HOME/.config/zellij/config.kdl

# Kitty
if [ ! -d "$HOME/.config/kitty" ]; then
	mkdir -p "$HOME/.config/kitty"
fi
ln -s $SOCIALST/Kitty/kitty.conf $HOME/.config/kitty/kitty.conf
ln -s $SOCIALST/Kitty/colors.conf $HOME/.config/kitty/colors.conf

# Python venv
#python -m venv $HOME/zbin/venv

# PDM
alias activate="source .venv/bin/activate"
