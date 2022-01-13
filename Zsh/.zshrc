# ~/.zshrc
#
# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e $HOME/Socialst/Zsh/manjaro-zsh-config ]]; then
  source $HOME/Socialst/Zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e $HOME/Socialst/Zsh/manjaro-zsh-prompt ]]; then
  source $HOME/Socialst/Zsh/manjaro-zsh-prompt
fi

export EDITOR="nvim"

#export TERMINAL="gnome-terminal"

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
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PYTHONPATH="$HOME/anaconda3"


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
alias ncplotinit="cp $HOME/Socialst/Templates/PyPlot_Template/nc_plot.py ./"
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
alias eleden_pluto="ssh -N -f -L localhost:8407:localhost:8407 kavis@Eleden"
alias eleden_jupyter="ssh -N -f -L localhost:8408:localhost:8408 kavis@Eleden"
alias eleden_code="ssh -N -f -L localhost:8409:localhost:8409 kavis@Eleden"
alias eleden_code2="ssh -N -f -L localhost:54321:localhost:54321 kavis@Eleden"
alias eleden_code_web="ssh -N -f -L localhost:5500:localhost:5500 kavis@Eleden"
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
alias gdrive="cd $HOME/Insync/edeftg@gmail.com/Google\ Drive"

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
export PATH="$HOME/anaconda3/bin:$PATH"

# ==============================================================================
# Julia Docker
# ==============================================================================
ZSHFN=$HOME/.zsh_fn
if [ -d $ZSHFN ]; then
    source $ZSHFN/*.zsh
fi

# ==============================================================================
# For PyTorch
# ==============================================================================
export PATH_DATASETS="$HOME/zdata/"
