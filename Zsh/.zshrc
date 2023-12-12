# ~/.zshrc

export TERM=xterm-256color

# not running interactively then bail
[[ $- != *i* ]] && return

# shell opts
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt completealiases
setopt histfindnodups
setopt incappendhistory
setopt sharehistory

# colors in less (default PAGER in Arch)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# reload ~/.zshrc and compile to .zwc ...  ZDOTDIR see:
# https://wiki.archlinux.org/index.php/zsh#Making_Zsh_your_default_shell
function zsrc() {
    local cache=""
    [[ -n $ZSH_CACHE_DIR ]] && cache=$ZSH_CACHE_DIR || cache="${ZDOTDIR:-$HOME}/.cache"
    autoload -U compinit zrecompile
    compinit -d "$cache/zcomp-$HOST"
    for f in ${ZDOTDIR:-$HOME}/.zshrc "$cache/zcomp-$HOST"; do
        zrecompile -p $f && command rm -f $f.zwc.old
    done
    source ${ZDOTDIR:-$HOME}/.zshrc
}
[[ ! -e ${ZDOTDIR:-$HOME}/.zshrc.zwc ]] && zsrc &>/dev/null

#al-info

export EDITOR="nvim"

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
#export EDITOR=/usr/bin/nano
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (on left side) similar to default bash prompt, or redhat zsh prompt with colors
 #PROMPT="%(!.%{$fg[red]%}[%n@%m %1~]%{$reset_color%}# .%{$fg[green]%}[%n@%m %1~]%{$reset_color%}$ "
# Maia prompt
PROMPT="%B%{$fg[cyan]%}%(4~|%-1~/.../%2~|%~)%u%b >%{$fg[cyan]%}>%B%(?.%{$fg[cyan]%}.%{$fg[red]%})>%{$reset_color%}%b " # Print some system information when the shell is first started
# Print a greeting message when shell is started
#echo $USER@$HOST  $(uname -srm) $(lsb_release -rcs)
## Prompt on right side:
#  - shows status of git when in git repository (code adapted from https://techanic.net/2012/12/30/my_git_prompt_for_zsh.html)
#  - shows exit status of previous command (if previous command finished with an error)
#  - is invisible, if neither is the case

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"                              # plus/minus     - clean repo
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"             # A"NUM"         - ahead by "NUM" commits
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"           # B"NUM"         - behind by "NUM" commits
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"     # lightning bolt - merge conflict
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"       # red circle     - untracked files
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"     # yellow circle  - tracked files modified
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"        # green circle   - staged changes present = ready for "git push"

parse_git_branch() {
  # Show Git branch/tag, or name-rev if on detached head
  ( git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD ) 2> /dev/null
}

parse_git_state() {
  # Show different symbols as appropriate for various Git repository states
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}

git_prompt_string() {
  local git_where="$(parse_git_branch)"
  
  # If inside a Git repository, print its branch and state
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
  
  # If not inside the Git repo, print exit codes of last command (only if it failed)
  [ ! -n "$git_where" ] && echo "%{$fg[red]%} %(?..[%?])"
}

## Plugins section: Enable fish style features
# Use syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# bind UP and DOWN arrow keys to history substring search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up			
bindkey '^[[B' history-substring-search-down

# Apply different settigns for different terminals
case $(basename "$(cat "/proc/$PPID/comm")") in
  login)
    	RPROMPT="%{$fg[red]%} %(?..[%?])" 
    	alias x='startx ~/.xinitrc'      # Type name of desired desktop after x, xinitrc is configured for it
    ;;
#  'tmux: server')
#        RPROMPT='$(git_prompt_string)'
#		## Base16 Shell color themes.
#		#possible themes: 3024, apathy, ashes, atelierdune, atelierforest, atelierhearth,
#		#atelierseaside, bespin, brewer, chalk, codeschool, colors, default, eighties, 
#		#embers, flat, google, grayscale, greenscreen, harmonic16, isotope, londontube,
#		#marrakesh, mocha, monokai, ocean, paraiso, pop (dark only), railscasts, shapesifter,
#		#solarized, summerfruit, tomorrow, twilight
#		#theme="eighties"
#		#Possible variants: dark and light
#		#shade="dark"
#		#BASE16_SHELL="/usr/share/zsh/scripts/base16-shell/base16-$theme.$shade.sh"
#		#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#		# Use autosuggestion
#		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
#     ;;
  *)
        RPROMPT='$(git_prompt_string)'
		# Use autosuggestion
		source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
		ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  		ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ;;
esac

# ==============================================================================
# Aliases
# ==============================================================================
alias ls='exa -lF --group-directories-first'  # preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first' # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.="exa -a | egrep '^\.'"                             # show only dotfiles

alias cat='bat --style header --style rules --style snip --style changes --style header'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

alias upd='sudo pacman -Syyu'
alias pac='sudo pacman --color auto'
alias merge='xrdb -merge ~/.Xresources'
alias grubup='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirrors='sudo reflector --score 100 --fastest 25 \
    --sort rate --save /etc/pacman.d/mirrorlist --verbose'
alias cp="cp -i"                                                # Confirm before overwriting something
alias df='df -h'                                                # Human-readable sizes
alias free='free -m'                                            # Show sizes in MB
alias SSHFORWARDLIST="ps aux | grep ssh"

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"


# Git
alias gaa="git add --all"
gcam() {
  git commit -am $1
}
alias gp="git push"
alias gitu='git add . && git commit && git push'

# ==============================================================================
# Environment
# ==============================================================================
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
#export SPARK_HOME="$HOME/zbin/spark-2.3.0-bin-hadoop2.7/"
#export CHPL_HOME="$HOME/zbin/chapel-1.22.1"
export PATH="$PATH:$HOME/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin"
export PATH="$PATH:$HOME/.cargo/bin"
#export PATH="$PATH:$SPARK_HOME/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.sage/local/bin"
export PATH="$PATH:$HOME/.npm-global/bin"
export PATH="$PATH:$HOME/.nimble/bin"
export PATH="$PATH:$CHPL_HOME/bin/linux64-x86_64"
export PATH="$PATH:$CHPL_HOME/util"
export PATH="$PATH:/usr/lib64/openmpi/bin/"
export PATH="$PATH:$HOME/go/bin/"
#export PATH="$PATH:$HOME/.pub-cache/bin"
#export PATH="$PATH:$HOME/.gem/ruby/2.5.0/bin/"
export MANPATH="$MANPATH:$CHPL_HOME/man"
#export CARP_DIR="$HOME/zbin/Carp"
export SCCACHE_DIR="$HOME/.cache/sccache"
#export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
#export PYTHONPATH="$HOME/anaconda3"
#export PATH="$HOME/.juliaup/bin:$PATH"

# ==============================================================================
# HEP
# ==============================================================================
export ROOTSYS=/usr
export PATH=$PATH:$ROOTSYS/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOTSYS/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ROOTSYS/lib

# ==============================================================================
# Templates
# ==============================================================================
alias latexinit="cp $HOME/Socialst/Templates/Latex_Template/* ./"
alias remarkinit="cp -r $HOME/Socialst/Templates/Remark_Template/* ./"
alias eisvogelinit="cp $HOME/Socialst/Templates/Eisvogel_Template/template.md ./"
alias typstinit="cp $HOME/Socialst/Templates/Typst_Template/* ./"
alias typstslideinit="cp -r $HOME/Socialst/Templates/Typst_Slide/* ./"
alias typstposterinit="cp -r $HOME/Socialst/Templates/Typst_Poster/* ./"
alias ncplotinit="cp $HOME/Socialst/Templates/PyPlot_Template/nc_plot.py ./"
alias pqplotinit="cp $HOME/Socialst/Templates/PyPlot_Template/pq_plot.py ./"
alias xkcdplotinit="cp $HOME/Socialst/Templates/PyPlot_Template/xkcd_plot.py ./"
alias nchistinit="cp $HOME/Socialst/Templates/PyPlot_Template/nc_hist.py ./"
alias ipcplotinit="cp $HOME/Socialst/Templates/PyPlot_Template/ipc_plot.py ./"
alias eisvogel_academy="cp $HOME/Socialst/Templates/Eisvogel_Template/academy.md ./"
alias eisvogel_geometry="cp $HOME/Socialst/Templates/Eisvogel_Template/geometry.md ./"
alias benchjulia="cp $HOME/Socialst/Templates/Julia_Template/bench.jl ./"

# ==============================================================================
# Eisvogel
# ==============================================================================
md2book() {
    filename=$1
    filename=${filename%.*}
    pandoc $1 -o $filename.pdf --from markdown --template eisvogel --listings --top-level-division=chapter
}
md2report() {
    filename=$1
    filename=${filename%.*}
    pandoc $1 -o $filename.pdf --from markdown --template eisvogel --listings
}
md2reportbib() {
    filename=$1
    filename=${filename%.*}
    pandoc --bibliography=ref.bib $1 -o $filename --from markdown --template eisvogel --listings
}
md2pdf() {
    filename=$1
    filename=${filename%.*}
    pandoc $1 --pdf-engine=xelatex -o $filename.pdf --from markdown --template eisvogel --listings
}

javawrapper() {
  export JAVA_HOME=$1; shift
  PATH=${JAVA_HOME}/bin:$PATH
}

chpllin() {
    filename=$1
    filename=${filename%.*}
    chpl -O -o bin/$filename $1
}

###-tns-completion-start-###
if [ -f /home/kavis/.tnsrc ]; then 
    source /home/kavis/.tnsrc 
fi
###-tns-completion-end-###

# ==============================================================================
# SSH Portforwarding
# ==============================================================================
#alias eleden_pluto="ssh -N -f -L localhost:8407:localhost:8407 kavis@Eleden"
alias eleden_jupyter="ssh -N -f -L localhost:8408:localhost:8408 kavis@Eleden"
alias eleden_lab="ssh -N -f -L localhost:8409:localhost:8409 kavis@Eleden"
alias command_code="ssh -N -f -L localhost:8409:localhost:8409 axect@CommandCenter"
alias command_jupyter="ssh -N -f -L localhost:8408:localhost:8408 axect@CommandCenter"
alias command_pluto="ssh -N -f -L localhost:8407:localhost:8407 axect@CommandCenter"

alias perox_doc="RUSTDOCFLAGS='--html-in-header katex-header.html' cargo doc --no-deps"
alias perox_check="cargo check --all-features"
alias perox_bt="cargo build --release --all-features && cargo test --release --all-features"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#powerline-daemon -q
#. /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

# ==============================================================================
# OpenBLAS
# ==============================================================================
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib/:$LD_LIBRARY_PATH

# ==============================================================================
# Project manager
# ==============================================================================
alias peroxide="cd $HOME/Documents/Project/Rust_Project/Peroxide"
alias nscool="cd $HOME/Documents/Project/Research/NSCool"

# ==============================================================================
# Spacemacs
# ==============================================================================
alias emnw="emacs -nw"

# ==============================================================================
# MESA
# ==============================================================================
#export MESASDK_ROOT="$HOME/zbin/mesasdk"
#source $MESASDK_ROOT/bin/mesasdk_init.sh
#export MESA_DIR="$HOME/zbin/mesa-r12778"
#export OMP_NUM_THREADS=12

# ==============================================================================
# dStar
# ==============================================================================
#export DSTAR_LIB_DIR="$HOME/Documents/Test/dStar/lib"
#export DSTAR_INC="$HOME/Documents/Test/dStar/include"
#export DSTAR_DIR="$HOME/Documents/Test/dStar"


# ==============================================================================
# Woroxide
# ==============================================================================
alias wordtest="cd $HOME/Documents/Project/Rust_Project/Woroxide && run_fast && cd -"
alias wordupdate="cd $HOME/Documents/Project/Rust_Project/Woroxide && code . && cd -"

# ==============================================================================
# RUST
# ==============================================================================
alias cargo_fast='RUSTFLAGS="-C target-cpu=native" cargo build --release'
alias cargo_asm='RUSTFLAGS="--emit=asm" cargo build --release'
alias run_fast='RUSTFLAGS="-C target-cpu=native" cargo run --release'
alias test_fast='RUSTFLAGS="-C target-cpu=native" cargo test --release'
alias make_target='mkdir target && \
sudo mount -t tmpfs none ./target && \
cat /proc/mounts | rg "$(pwd)" | sudo tee -a /etc/fstab'

# ==============================================================================
# Zig
# ==============================================================================
export PATH=$PATH:$HOME/zbin/zig/build/bin
alias zig_fast="zig build-exe -O ReleaseFast -target x86_64-linux-gnu"

# ==============================================================================
# Google drive
# ==============================================================================
alias gdrive="cd $HOME/Insync/axect@outlook.kr/Google\ Drive"

# ==============================================================================
# Deno
# ==============================================================================
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# ==============================================================================
# Ruby
# ==============================================================================
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"

# ==============================================================================
# Gogh
# ==============================================================================
alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'

# ==============================================================================
# Nim
# ==============================================================================
alias nimc='nim c -d:release -d:danger'
alias nimblas='nim c -d:release -d:danger -d:openblas -d:blas=cblas'

# ==============================================================================
# Chapel
# ==============================================================================
alias chplblas='chpl -O -I/opt/OpenBLAS/include -L/opt/OpenBLAS/lib -lopenblas'

# ==============================================================================
# PYRS
# ==============================================================================
#export VIRTUAL_ENV='$HOME/zbin/pyrs'

# ==============================================================================
# Julia
# ==============================================================================
alias juliasci='julia -J /home/xteca/zlib/sys_science.so'
alias juliaml='julia -J /home/xteca/zlib/sys_ml.so'

# ==============================================================================
# nnn
# ==============================================================================
export NNN_BMS='d:~/Documents;D:~/Downloads/;g:~/Insync/edeftg@gmail.com/Google Drive/;b:~/Insync/edeftg@gmail.com/Google Drive/Books;u:~/Insync/edeftg@gmail.com/Google Drive/Business'
export NNN_COLORS="2136"
export NNN_TRASH=1
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='f:finder;o:fzopen;p:pdfview;d:diffs;t:nmount'
nnn_cd()                                                                                                   
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi  
}

trap nnn_cd EXIT

# ==============================================================================
# Remark & Decktape
# ==============================================================================
remark2pdf() {
    noext=${1%%.*}
    decktape -s 1280x720 --chrome-path /usr/bin/google-chrome-beta http://127.0.0.1:5500/$noext.html $noext.pdf
}

# ==============================================================================
# Pythia
# ==============================================================================
pythia8() {
    g++ $1.cc -o $1 `pythia8-config --cppflags --libs`
}

# ==============================================================================
# Eazy-py
# ==============================================================================
export EAZYCODE="$HOME/zbin/eazy-py/eazy-photoz"

# ==============================================================================
# Firefly
# ==============================================================================
export FF_DIR="$HOME/zbin/firefly_release"
export STELLARPOPMODELS_DIR="$HOME/zbin/firefly_release/stellar_population_models"

# ==============================================================================
# zoxide
# ==============================================================================
eval "$(zoxide init zsh)"

# ==============================================================================
# SNAP
# ==============================================================================
export PATH="/snap/bin:$PATH"

# ==============================================================================
# BLACKHAWK
# ==============================================================================
export BLACKHAWK_PATH="$HOME/zbin/blackhawk_v2.0"

# ==============================================================================
# SNOwGLoBES
# ==============================================================================
export GLB_DIR="/usr/local/"
export SNOWGLOBES="$HOME/zbin/snowglobes"

# ==============================================================================
# C++ Tools
# ==============================================================================
cppdebug() {
    filename=$(basename -- $1)
    filename=${filename%%.*}
    g++ -O3 -o "bin/$filename" -fstack-usage $1
    bat "bin/$filename.su"
}

cpprun() {
    filename=$(basename -- $1)
    filename=${filename%%.*}
    g++ -O3 -o "bin/$filename" $1 $2
    ./bin/$filename
}

cppbuild() {
    filename=$(basename -- $1)
    filename=${filename%%.*}
    g++ -O3 -o "bin/$filename" $1 $2
}

cppasm() {
    filename=$(basename -- $1)
    filename=${filename%%.*}
    g++ -O3 -S -o "bin/${filename}.asm" $1
    bat bin/${filename}.asm
}

export CXXFLAGS="-g -std=c++20"

# ==============================================================================
# Countdown
# ==============================================================================
countdown() {
    termdown -v en -c 10 $1
}

# ==============================================================================
# Anaconda
# ==============================================================================
#export PATH="$HOME/anaconda3/bin:$PATH"

# ==============================================================================
# Julia Docker
# ==============================================================================
ZSHFN=$HOME/.zsh_fn
if [ -d $ZSHFN ]; then
    source $ZSHFN/julia.zsh
fi

# ==============================================================================
# For PyTorch
# ==============================================================================
export PATH_DATASETS="$HOME/zdata/"

# ==============================================================================
# For Presentation
# ==============================================================================
alias random_present="cd $HOME/Documents/Project/SYTEARK/ML2022/week08/random_present/ && run_fast && cd -"

# ==============================================================================
# Ruby
# ==============================================================================
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
draw_tree() {
    rsyntaxtree -n serif "$(cat $1)"
}

# ==============================================================================
# PyEnv
# ==============================================================================
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

source "$HOME/.config/broot/launcher/bash/br"

# ==============================================================================
# Zellij
# ==============================================================================
zell() {
    filename=$(basename -- $1)
    filename=${filename%%.*}
    zellij --layout $HOME/Socialst/Zellij/$filename.kdl
}

# ==============================================================================
# XZ with LZMA
# ==============================================================================
xzma16() {
    tar -cf - $1 | xz --lzma2=dict=1536Mi,nice=273 -c - > $1.tar.xz
}

# ==============================================================================
# Custom git
# ==============================================================================
gitcl() {
    git clone git@github.com:Axect/$1.git
}

# ==============================================================================
# PDF to PNG
# ==============================================================================
pdf2png() {
    pdftoppm -png -r 300 $1 $1
}

export HDF5_DISABLE_VERSION_CHECK=1

# ==============================================================================
# Python venv
# ==============================================================================
#alias activate_venv="source $HOME/zbin/venv/bin/activate"

# ==============================================================================
# Miniconda
# ==============================================================================
#activate_conda() {
#    source /opt/miniconda3/etc/profile.d/conda.sh
#    conda activate
#}

# ==============================================================================
# PDM
# ==============================================================================
alias activate="source .venv/bin/activate"

# ==============================================================================
# nvitop
# ==============================================================================
alias nvitop="pipx run nvitop"

# ==============================================================================
# MCFLY
# ==============================================================================
eval "$(mcfly init zsh)"
export MCFLY_PROMPT="❯"

# ==============================================================================
# Rustag
# ==============================================================================
rtg() {
  RUSTAG=$(rustag $@)
  
  # RUSTAG contains "Error" then just print else cd $(RUSTAG)
  if [[ $RUSTAG == *"Error"* ]]; then
    echo $RUSTAG
  else
    cd $RUSTAG
  fi
}
