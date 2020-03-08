# Socialst (Axect's Customization Repo)

## Usage

### Use whole custom environments

* Execute `Socialst/Script/env.sh`

### Vim / Neovim / Spacevim

The main vim environment is neovim.

* If you want to classical vim, then copy my `Vim/.vimrc`
* If you want to Spacevim, then copy my `SpaceVim/init.toml` to `~/.SpaceVim.d/init.toml`
* If you want to use neovim, then copy my `NeoVim/init.vim` to `~/.config/nvim/init.vim`

#### Setup Environment for Neovim

```sh
# 1. Link neovim config file (You should have ~/.config/nvim directory)
ln -s $HOME/Socialst/Neovim/init.vim $HOME/.config/nvim/init.vim

# 2. Install coc-extensions
sh $HOME/Socialst/Script/coc.sh
```

* To use more `coc-extensions`, refer [coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

### ZSH

Environment Settings for below programs :

* zsh
* Oh-my-zsh
* Npm
* Java
* Chapel
* Rust
* Haskell
* Nim
* Stack
* fzf
* Heptools
    * ROOT
* miniconda

And there are auto template generators

* `latexinit` : Latex template
* `remarkinit` : RemarkJS template
* `eisvogelinit` : Eisvogel template
* `pylabinit` : Matplotlib template

There are useful aliases for Arch linux

* `upd` : `sudo pacman -Syyu`
* `pac` : `sudo pacman --color auto`
* `mirrors` : `sudo reflector --score 100 --fastest 25 --sort rate --save /etc/pacman.d/mirrorlist --verbose`
* `cp` : `cp -i`
* `df` : `df -h`
* `ls` : `ls -lA`

### LaTeX

Style File. Just copy my `LaTeX/Socialst.sty` to your latex project folder and type:

```LaTeX
\usepackage{Socialst}
```

### Visual Studio Code

Setting file. Copy to your vs code setting file directory.

### Script

To copy my whole github.

### Pandoc

To use Eisvogel pandoc template.

First, you should install pandoc and texlive

```sh
# Arch
yaourt -S pandoc
yaourt -S texlive-most texlive-lang

# Fedora
sudo dnf install pandoc
sudo dnf install texlive-scheme-full

# Ubuntu
sudo apt-get install pandoc
sudo apt-get install texlive-full
```

Second, you need this repository

```sh
git clone https://github.com/Axect/Socialst

# if you already have,
cd ~/Socialst
git pull
```

Third, you should make pandoc template directory

```sh
cd ~
mkdir -p .pandoc/templates
```

Fourth, copy my `eisvogel.latex` file (it includes kotex)

```sh
cp ~/Socialst/Pandoc/eisvogel.latex ~/.pandoc/templates/./
```

Fiveth, copy my `.zshrc` file or just copy `eisvogelinit` and `md2pdf`

```sh
cp ~/Socialst/Zsh/.zshrc ~/.zshrc
```

Finally, source zshrc

```sh
source ~/.zshrc
```

**Usage**

1. Go to Folder
2. `eisvogelinit`
3. Change file name (template.md to other)
4. `md2report file_name` (no .md needed)
    * or `md2book file_name` : Book scheme
