# Socialst (Axect's Customization Repo)

## Use


### Vim

* If you want to classical vim, then copy my `Vim/.vimrc`
* If you want to Spacevim, then copy my `SpaceVim/init.toml` to `~/.SpaceVim.d/init.toml`
* If you want to use neovim, then copy my `NeoVim/init.vim` to `~/.config/nvim/init.vim`

### ZSH

Environment Settings for below programs :

* zsh
* Oh-my-zsh
* Npm
* Nix
* Java
* Go
* Chapel
* Rust
* Haskell
* Nim
* Stack
* fzf
* Neovim
* Nix

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
4. `md2pdf file_name` (no .md needed)
