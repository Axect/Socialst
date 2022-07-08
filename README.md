# Socialst (Axect's Customization Repo)

You can setup new arch linux laptop or desktop easily with `Socialst`

## Setup new Arch laptop or desktop

1. Clone this repo at your home directory (check : `echo $HOME`)
```sh
git clone https://github.com/Axect/Socialst
```

2. Go to Script directory
```sh
cd Socialst/Script
```

3. Go to `00_Arch` directory
```sh
cd 00_Arch
```

4. Install `yay` (If you already installed `yay` then skip this process)
```sh
sh yay.sh
```

5. Install packages
```sh
sh package.sh
```

6. Go back to Script directory
```sh
cd ..
```

7. Execute shell script files sequentially
    1. `01_env.sh` : Setup for zsh, vim, eisvogel, zathura, input method, zellij
        * Recommend : Custom zsh, Neovim, UIM
    2. `02_git.sh` : Configure git with an option: `credential.helper store`
    3. `03_proj.sh` : Clone whole projects for `https://github.com/Axect` (It is just for my convenience - You don't need to execute this file)
    4. `04_rust.sh` : Setup rust via `rustup`
    5. `05_rust_analyzer.sh` : Install rust analyzer
    6. `06_cargo.sh` : Install useful applications via `cargo`
    7. `07_coc.sh` : If you chose 'Neovim' in `01_env.sh`, then this script provided setup for `Coc`
    8. `08_nim.sh` : Install nim via `choosenim`
    9. `09_rprofile.sh` : Change R repo to Seoul (If you are not korean, this script file may be harmful)
    10. `10_R.sh` : Install useful R packages
    11. `11_npm.sh` : Create `.npm-global` directory and prefix
    12. `12_extra_python.sh` : Install extra useful python packages via `pip`
    13. `13_file.sh` : Make nautilus default file manager (If you don't use nautilus, it may be harmful)
    14. `14_openblas.sh` : Download & Make `OpenBLAS` to `/opt` directory (You should have `$HOME/zbin` directory before executing this)
    15. `15_root_jupyter.sh` : Install ROOT jupyter kernel
    16. `16_julia_docker.sh` : Julia docker setup (Deprecated)
    17. `17_julia_package.jl` : Install julia packages (Execute by `julia 17_julia_package.jl`)
    18. `18_haskell.sh` : Install haskell via `ghcup`
    19. `19_xkcd.sh` : Setup xkcd font for matplotlib
    20. `20_npm_package.sh` : Install useful npm packages 

8. After hook
    * If you set UIM in `sh 01_env.sh`, then you should configure UIM via `uim-pref-gtk`. If you are korean, then refer [Arch UIM Setup](https://wiki.archlinux.org/title/Localization_(%ED%95%9C%EA%B5%AD%EC%96%B4)/Korean_(%ED%95%9C%EA%B5%AD%EC%96%B4)#uim-byeoru). If you finish setup, then should logout or reboot.

9. Useful commands (alias & zsh functions)
    * Git
        * `gitu` : `git add . && git commit && git push`
    * Latex
        * `latexinit` : Generate initial latex files from `Socialst/Templates/Latex_Template/`
    * Remark
        * `remarkinit` : Generate remark files from `Socialst/Templates/Remark_Template/`
        * `remark2pdf` : Generate PDF file from remark slide show
    * Eisvogel (Pandoc)
        * `eisvogelinit` : Generate pandoc files from `Socialst/Templates/Eisvogel_Template/`
        * `md2pdf FILENAME` : Generate PDF file from markdown file
    * Python
        * `ncplotinit` : Template for matplotlib + netCDF4
    * C++
        * `cppdebug FILENAME` : Compile & Debug via `-fstack-usage`
        * `cpprun FILENAME` : Compile & Run with `-O3`
        * `cppbuild FILENAME` : Compile with `-O3`
        * `cppasm FILENAME` : Compile & Generate `.asm`
    * Tools
        * `countdown TIME` : Countdown in terminal via `termdown`
        * `zell FILENAME` : `zellij --layout $HOME/Socialst/Zellij/$FILENAME.yaml`

## Setup for non Arch user

Although you are not Arch user, you can setup with Socialst.

1. Zsh
    * Pre-requisites
        * `zsh`
        * `zsh-history-substring-search`
        * `zsh-autosuggestions`
        * `zsh-syntax-highlighting`
        * `zsh-completions`
        * `fzf`
    * Setup
        ```sh
        # Backup .zshrc file (if exists)
        mv $HOME/.zshrc $HOME/.zshrc.old

        # Create link to Socialst
        ln -s $HOME/Socialst/Zsh/.zshrc $HOME/.zshrc

        # Make zsh default
        chsh -s `which zsh`
        ```

2. Neovim
    * Pre-requisites
        * `neovim`
        * `python-neovim`
        * `xclip`
        * `powerline`
        * `powerline-fonts`
    * Setup
        ```sh
        # Download vim-plug
        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

        # Create .config/nvim directory if not exists
        if [ ! -d "$HOME/.config/nvim" ]; then
            mkdir $HOME/.config/nvim
        fi

        # Create symbolic link to Socialst
        ln -s $SOCIALST/NeoVim/init.vim $HOME/.config/nvim/init.vim
        ```

3. Eisvogel
    * Pre-requisites
        * `texlive`
        * `pandoc`
    * Setup
        ```sh
        mkdir -p $HOME/.pandoc/templates
        ln -s $SOCIALST/Pandoc/eisvogel.latex $HOME/.pandoc/templates/eisvogel.latex
        ```

4. Zellij
    * Pre-requisites
        * `rust`
        * `cargo`
        * Above Zsh setup
    * Setup
        ```sh
        # Install Zellij
        cargo install zellij

        # For key binding
        if [ ! -d "$HOME/.config/zellij" ]; then
          mkdir -p "$HOME/.config/zellij"
        fi
        ln -s $SOCIALST/Zellij/config.yaml $HOME/.config/zellij/config.yaml
        ```

5. Other available shell scripts (For almost all of linux distros)
    * `02_git.sh` : Configure git with an option: `credential.helper store`
    * `04_rust.sh` : Setup rust via `rustup`
    * `06_cargo.sh` : Install useful applications via `cargo`
    * `07_coc.sh` : If you chose 'Neovim' in `01_env.sh`, then this script provided setup for `Coc`
    * `08_nim.sh` : Install nim via `choosenim`
    * `11_npm.sh` : Create `.npm-global` directory and prefix
    * `12_extra_python.sh` : Install extra useful python packages via `pip`
    * `14_openblas.sh` : Download & Make `OpenBLAS` to `/opt` directory (You should have `$HOME/zbin` directory before executing this)
    * `15_root_jupyter.sh` : Install ROOT jupyter kernel
    * `20_npm_package.sh` : Install useful npm packages 


