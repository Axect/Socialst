#!/bin/sh
SOCIALST="$HOME/Socialst"
AXECT="https://github.com/Axect"

# Socialst
if [ ! -d "$SOCIALST" ]; then
  cd $HOME
  git clone "${AXECT}/Socialst"
fi

# zshrc
if [ ! -d "$HOME/.zshrc" ]; then
 #sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
 chsh -s `which zsh`
 ln -s $SOCIALST/Zsh/.zshrc $HOME/.zshrc
 echo "Complete zsh Setup!"
fi

# Spacevim
if [ ! -d "$HOME/.SpaceVim" ]; then
  curl -sLf https://spacevim.org/install.sh | bash
  mkdir $HOME/.SpaceVim.d
  ln -s $SOCIALST/SpaceVim/init.toml $HOME/.SpaceVim.d/init.toml
  echo "Complete vim Setup!"
fi

# tmux
#if [ ! -d "$HOME/.tmux.conf.local" ]; then
#  cd $HOME
#  git clone https://github.com/gpakosz/.tmux.git
#  ln -s -f .tmux/.tmux.conf
#  ln -s $SOCIALST/Tmux/.tmux.conf.local $HOME/.tmux.conf.local
#  echo "Complete tmux Setup!"
#fi

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
if [ ! -d "$HOME/.config/Code" ]; then
  mkdir -p "$HOME/.config/Code"
fi

if [ ! -d "$HOME/.config/Code/User/snippets/" ]; then
  mkdir -p "$HOME/.config/Code/User/snippets"
fi

if [ ! -d "$HOME/.config/Code/User/snippets/socialst.code-snippets" ]; then
  ln -s $SOCIALST/Code/socialst.code-snippets $HOME/.config/Code/User/snippets/socialst.code-snippets
fi
