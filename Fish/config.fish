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

# Add nvm default node to PATH (prepend to override system node)
set -gx PATH ~/.nvm/versions/node/v25.1.0/bin $PATH
set -gx CUDA_HOME /usr
