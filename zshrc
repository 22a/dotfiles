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


# asdf completions
source $(brew --prefix asdf)/libexec/asdf.sh

# zoxide (rupa/z) setup
eval "$(zoxide init --cmd j zsh)"

# # activate rbenv
# eval "$(rbenv init -)"

# # activate nvm + load completion
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# volta pnpm ff
export VOLTA_FEATURE_PNPM=1

repos() {
  local dirs_to_run_in=(
    "$HOME/src/embercom"
    "$HOME/src/pulse"
    "$HOME/src/embercom-composer"
    "$HOME/src/embercom-prosemirror-composer"
    "$HOME/src/intersection"
    "$HOME/src/billing-admin"
  )
  local full_command="$@"
  for dir in "${dirs_to_run_in[@]}"; do
    if [[ -d "$dir" ]]; then
      echo "${dir##*/}"
      (cd "$dir" && eval "$full_command")
    else
      echo "Directory '$dir' does not exist."
    fi
  done
}

#
############################################
# zprof - zsh profiling
# uncomment `zmodload` , move to top of file
# uncomment `zprof` , leave it at the end
# open a new shell, check out the output
############################################

# zmodload zsh/zprof
# zprof
