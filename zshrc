# zplug directory created by brew
export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async"
zplug "22a/purest"
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

# pretend we have fzf everywhere
bindkey -s "^P" "nvim \$(fzf --preview 'head -100 {}')\n"


export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='open'

if [[ -z "$LANG" ]]; then
  export LANG='en_GB.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Set the default Less options
# -g (Highlight only last match for searches)
# -w (Highlight first new line after forward-screen)
# -i (Ignore case in searches)
# -q (Quiet the terminal bell)
# -r (Raw control chars)
# -M (Set long prompt style)
# -S (Chop long lines)
# -X (Disable screen clearing)
# -F (Exit if content fits on one screen)
export LESS='-g -w -i -q -r -M -S -X -F'

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

export INTERCOM_USER=`cat ~/.intercom_user`

# activate rbenv
eval "$(rbenv init -)"

# activate pilot
export PATH=$HOME/.pilot/bin:$PATH
if command -v pilot; then;
  eval $(pilot env)
fi

# activate nvm + load completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# source yarn globals
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function tn () {
  # new tmux session with random name
  tmux new -s $(~/dotfiles/scripts/random_word.sh)
}

# Aliases
source ~/.aliases
source ~/.aliases.priv
