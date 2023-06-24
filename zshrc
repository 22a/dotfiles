############################################
# p10k - a customizable prompt, seems neat
# https://github.com/romkatv/powerlevel10k
############################################
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


############################################
# $PATH
############################################
path=(
  /usr/local/{bin,sbin}
  /opt/homebrew/bin
  /home/linuxbrew/.linuxbrew/bin
  $HOME/bin
  $HOME/.yarn/bin
  $HOME/.config/yarn/global/node_modules/.bin
  $path
)


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

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='open'

# Aliases
source ~/.aliases
source ~/.aliases.priv

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# make Ctrl+P in zsh do the same as it does in vim
bindkey -s "^P" "nvim -c 'Telescope find_files'\n"

# up and down arrows for history substring search
for key ('^[[A' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down

# Ensure path arrays do not contain duplicates
typeset -gU cdpath fpath mailpath path

# activate rbenv
eval "$(rbenv init -)"

# # activate nvm + load completion
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

lazy_load_nvm() {
  unset -f npm yarn node nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

npm() {
 lazy_load_nvm
 npm $@
}

yarn() {
 lazy_load_nvm
 yarn $@
}

node() {
  lazy_load_nvm
  node $@
}

nvm() {
  lazy_load_nvm
  nvm $@
}


############################################
# zprof - zsh profiling
# uncomment `zmodload` , move to top of file
# uncomment `zprof` , leave it at the end
# open a new shell, check out the output
############################################

# zmodload zsh/zprof
# zprof
