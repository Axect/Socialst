# ~/.config/fish/config.fish
# Fish shell configuration converted from .bashrc

# Fish handles history automatically, but you can configure it
set -U fish_history_max_size 2000

# Color support for ls (fish has built-in color support)
if type -q dircolors
    if test -r ~/.dircolors
        eval (dircolors -c ~/.dircolors | source)
    else
        eval (dircolors -c | source)
    end
end

# Aliases for ls using exa
alias ll='exa -alF'
alias la='exa -A'
alias l='exa -CF'

# Colored grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Alert alias for long running commands
alias alert='notify-send --urgency=low -i "(test $status = 0; and echo terminal; or echo error)" (history | tail -n1 | sed -e \'s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//\')'

# Source bash aliases if they exist (you may want to convert this to fish format)
if type -q bass; and test -f ~/.bash_aliases
    bass source ~/.bash_aliases
end

# Cargo environment (fish native)
if test -f "$HOME/.cargo/env.fish"
    source "$HOME/.cargo/env.fish"
else if type -q bass; and test -f "$HOME/.cargo/env"
    bass source "$HOME/.cargo/env"
end

# Local bin environment
if type -q bass; and test -f "$HOME/.local/bin/env"
    bass source "$HOME/.local/bin/env"
end

# NVM configuration
# Using nvm.fish plugin (installed via fisher)
# No additional configuration needed - nvm command is available automatically
set -gx NVM_DIR "$HOME/.nvm"

# Directory jumping with zoxide (smarter z alternative)
# Usage: z <directory_name> to jump to frequently used directories
# zi for interactive selection
zoxide init fish | source

# ==============================================================================
# NeuralSMEFT
# ==============================================================================
set -gx NEURALSMEFT_WEIGHTS_DIR "$HOME/Dropbox/Research/SMEFTML_DB/weights"

# ==============================================================================
# OSPREY
# ==============================================================================
set -gx BLACKHAWK_DIR "$HOME/zbin/blackhawk_v2.3"
#set -gx PYTHIA_TABLES_DIR "$HOME/Dropbox/Research/OSPREY/data/pythia_new_table"

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

# Rustag function
function rtg
  set -l output (rustag $argv)
  set -l last_line (echo $output | tail -n 1)

  # Check if the last line is a valid directory path
  if test -d "$last_line"
    cd "$last_line"
  else
    echo "$output"
  end
end

# nvm.fish handles node PATH automatically
set -gx CUDA_HOME /usr

# Typst font path
set -gx TYPST_FONT_PATHS "$HOME/.local/share/fonts"

# ==============================================================================
# Peroxide
# ==============================================================================
alias perox_doc="RUSTDOCFLAGS='--html-in-header katex-header.html' cargo doc --no-deps"
alias perox_check="cargo check --all-features"
alias perox_bt="cargo build --release --all-features && cargo test --release --all-features"

# ==============================================================================
# uv Python shared library (for PyO3)
# ==============================================================================
set -gx LD_LIBRARY_PATH $HOME/.local/share/uv/python/cpython-3.13.12-linux-x86_64-gnu/lib $LD_LIBRARY_PATH
export PATH="$HOME/.local/bin:$PATH"

# ==============================================================================
# Vast.ai SSH
# ==============================================================================
function vastssh
    TERM=xterm-256color command ssh $argv
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# mclaude
alias mclaude-update="npx cc-mirror update mclaude --claude-version latest"

# claude-code
alias claude-gang="claude --dangerously-skip-permissions"
alias claude-morgen="claude --dangerously-skip-permissions --channels plugin:telegram@claude-plugins-official"
alias mclaude-gang="mclaude --dangerously-skip-permissions"
set -gx MCP_TIMEOUT 3600000  # MCP server timeout: 1 hour (default 30s)

alias zai-gang="zai --dangerously-skip-permissions"

# zellij remote session
alias zj='zellij attach --create main'

# Auto-attach zellij in interactive kitty sessions (공유 'main' 세션).
# 창을 여러 개 여는 대신 한 창에서 zellij 탭으로 병렬 작업하기 위함.
# SSH / VSCode / 이미 zellij 안인 경우는 제외. exec로 셸을 대체해 중첩 방지.
# 비활성화하려면 이 블록을 주석 처리하면 됨 (수동 attach는 위의 `zj` 사용).
if status is-interactive
    and set -q KITTY_WINDOW_ID
    and not set -q ZELLIJ
    and not set -q SSH_CONNECTION
    and test "$TERM_PROGRAM" != vscode
    if type -q zellij
        exec zellij attach --create main
    end
end


# Added by Antigravity CLI installer
set -gx PATH "/home/axect/.local/bin" $PATH
