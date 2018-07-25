# zplug directory created by brew
export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh

zplug "22a/purest"
zplug "djui/alias-tips"
zplug "mafredri/zsh-async"
zplug "modules/completion", from:prezto
zplug "paulirish/git-open", as:plugin
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "rupa/z", use:z.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
  echo "Installing zplug plugins..."
  zplug install
fi

zplug load

# vi keybindings for repl text input
bindkey -v

# up and down arrows for history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# save me from myself, hitting ^P is engrained in my muscle memory now
bindkey -s "^P" 'ctrlp\n'

# command history please
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
# share history between sessions
setopt INC_APPEND_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait for additional characters in sequence. Default is 40 (400 ms).
KEYTIMEOUT=1 # 10 ms

# use rg for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob \!.git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# source fzf binary, completions, and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function tn () {
  # new tmux session with random name
  tmux new -s $(~/dotfiles/scripts/random_word.sh)
}

# source yarn globals
export PATH="$PATH:`yarn global bin`"
# pls yarn
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# source local executables
export PATH="$PATH:$HOME/.local/bin"

# activate rbenv
eval "$(rbenv init -)"

# Aliases
source ~/.aliases
source ~/.aliases.priv
