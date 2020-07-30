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
    elif [ -d "$HOME/.zshrc" ]; then
        echo "Backup original .zshrc to .zshrc.old"
        mv $HOME/.zshrc $HOME/.zshrc.old
    fi
    ln -s $SOCIALST/Zsh/.zshrc $HOME/.zshrc
    chsh -s `which zsh`
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
echo "1. Vim, 2. Spacevim, 3. Neovim"

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
    echo "Complete to setup neovim"
fi

# tmux
if [ ! -d "$HOME/.tmux.conf.local" ]; then
  cd $HOME
  git clone https://github.com/gpakosz/.tmux.git
  ln -s -f .tmux/.tmux.conf
  ln -s $SOCIALST/Tmux/.tmux.conf.local $HOME/.tmux.conf.local
  echo "Complete tmux Setup!"
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

# Code
echo "Do you want to setup for VSCode? [y/n]"

read code

if [ $code = "y" ]; then
    if [ ! -d "$HOME/.config/Code" ]; then
        mkdir -p "$HOME/.config/Code"
    fi

    if [ ! -d "$HOME/.config/Code\ -\ OSS" ]; then
        mkdir -p "$HOME/.config/Code\ -\ OSS"
    fi

    if [ ! -d "$HOME/.config/Code/User/snippets/" ]; then
        mkdir -p "$HOME/.config/Code/User/snippets"
    fi

    if [ ! -d "$HOME/.config/Code\ -\ OSS/User/snippets/" ]; then
        mkdir -p "$HOME/.config/Code\ -\ OSS/User/snippets"
    fi

    if [ ! -d "$HOME/.config/Code/User/snippets/socialst.code-snippets" ]; then
        ln -s $SOCIALST/Code/socialst.code-snippets $HOME/.config/Code/User/snippets/socialst.code-snippets
    fi

    if [ ! -d "$HOME/.config/Code\ -\ OSS/User/snippets/socialst.code-snippets" ]; then
        ln -s $SOCIALST/Code/socialst.code-snippets $HOME/.config/Code\ -\ OSS/User/snippets/socialst.code-snippets
    fi
else
    echo "Skip code setup"
fi

# Xprofile
echo "What kinds of input method do you want to use?"
echo "1. ibus, 2. uim, 3. skip"

read input_method

if [ $input_method -eq 1 ]; then
    if [ ! -d "$HOME/.xprofile" ]; then
        ln -s $SOCIALST/IBUS/xprofile $HOME/.xprofile
    fi
elif [ $input_method -eq 2 ]; then
    if [ ! -d "$HOME/.xprofile" ]; then
        ln -s $SOCIALST/UIM/xprofile $HOME/.xprofile
    fi
else
    echo "Skip input method setup"
fi

# Typora
echo "Setup for typora? [y/n]"
read typora

if [ $typora = "y" ]; then
    rm $HOME/.config/Typora/themes/whitey.css
    ln -s $SOCIALST/Typora/whitey.css $HOME/.config/Typora/themes/whitey.css
elif [ $typora = "n" ]; then
    echo "Finish"
fi
