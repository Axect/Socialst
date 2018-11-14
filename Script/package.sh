# Official Repository
yaourt -S uim texlive-most texlive-lang tk gcc-fortran r jupyter-notebook\
  python-pip python-numpy python-scipy python-matplotlib npm zathura-ps zathura-pdf-poppler zathura-djvu zathura-cb\
  julia sagemath dlang pandoc\
  zsh-history-substring-search zsh-autosuggestions --noconfirm
  
# AUR
yaourt -S nerd-fonts-complete-mono-glyphs\
  slack-desktop grive ttf-nanum mailspring\
  rstudio-desktop-bin visual-studio-code-bin sagemath-jupyter --noconfirm

# Rust
curl https://sh.rustup.rs -sSf | sh

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
