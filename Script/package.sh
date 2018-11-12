sudo pamac install uim texlive-most texlive-lang tk gcc-fortran r jupyter-notebook\
  python-pip python-numpy python-scipy python-matplotlib npm zathura-ps zathura-pdf zathura-djvu zathura-cb\
  julia sagemath dlang 
  
pamac build nerd-fonts-complete-mono-glyphs\
  slack-desktop grive ttf-nanum mailspring\
  rstudio-desktop-bin visual-studio-code-bin

# Rust
curl https://sh.rustup.rs -sSf | sh

# Nim
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
