############################################
# $PATH
############################################
path=(
  /usr/local/{bin,sbin}
  /opt/homebrew/bin
  $HOME/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $path
)

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

############################################
# ZIM - used for zsh plugin management
# https://github.com/zimfw/zimfw
############################################

# let zim use its `degit` tool for downloading plugins instead of git
zstyle ':zim:zmodule' use 'degit'
# let zim's input module expand ../../.. automatically
zstyle ':zim:input' double-dot-expand yes
# Set a custom prefix for the generated aliases. The default is 'G'.
zstyle ':zim:git' aliases-prefix 'g'

# Set zim config directory
export ZIM_HOME=~/.zim
# Download zimfw plugin manager if missing
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if outdated
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize zim modules
source ${ZIM_HOME}/init.zsh


############################################
# User config
############################################

HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait for
# additional characters in sequence. Default is 40 (400 ms).
KEYTIMEOUT=1 # 10 ms

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export BROWSER='open'

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# up and down arrows for history substring search
for key ('^[[A' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down

# asdf completions
source $(brew --prefix asdf)/libexec/asdf.sh

# zoxide (rupa/z) setup
eval "$(zoxide init --cmd j zsh)"

# Aliases
source ~/.aliases
source ~/.aliases.priv
