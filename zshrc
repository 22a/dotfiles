############################################
# ZIM - used for zsh plugin management
# https://github.com/zimfw/zimfw
############################################

# let zim use its `degit` tool for downloading plugins instead of git
zstyle ':zim:zmodule' use 'degit'
# Set zim config directory
export ZIM_HOME=~/.config/.zim
# Set zim config directory
export ZDOTDIR=~/.config
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
# History config
############################################

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait for
# additional characters in sequence. Default is 40 (400 ms).
KEYTIMEOUT=1 # 10 ms
# set zsh command history file
HISTFILE=~/.zsh_history
# let it grow big
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
# Write the history file in the ":start:elapsed;command" format
setopt EXTENDED_HISTORY
# Write to the history file immediately, not when the shell exits
setopt INC_APPEND_HISTORY
# Share history between all sessions
setopt SHARE_HISTORY
# Expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST
# Don't record an entry that was just recorded again (different to
# `setopt HIST_IGNORE_ALL_DUPS` which deletes old history entries if
# the new entry is a duplicate)
setopt HIST_IGNORE_DUPS
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# Don't execute immediately upon history expansion.
setopt HIST_VERIFY


############################################
# User config
############################################

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='open'

if [[ -z "$LANG" ]]; then
  export LANG='en_IE.UTF-8'
fi

# Set the default Less options
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Aliases
source ~/.aliases
source ~/.aliases.priv

# vi keybindings for repl text input
bindkey -v

# up and down arrows for history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# make Ctrl+P in zsh do the same as it does in vim
bindkey -s "^P" "nvim -c 'Telescope find_files'\n"

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# Set the list of directories that zsh searches for programs
path=(
  /usr/local/{bin,sbin}
  /opt/homebrew/bin
  $HOME/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $path
)


############################################
# p10k - a customizable prompt, seems neat
# https://github.com/romkatv/powerlevel10k
############################################

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


############################################
# zprof - zsh profiling
# uncomment `zmodload` , move to top of file
# uncomment `zprof` , leave it at the end
# open a new shell, check out the output
############################################

# zmodload zsh/zprof
# zprof
