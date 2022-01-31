export ZPLUG_HOME=$(brew --prefix)/opt/zplug
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
bindkey -s "^P" "ctrlp\n"


export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='open'

if [[ -z "$LANG" ]]; then
  export LANG='en_IE.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $HOME/bin
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
# export LESS='-g -w -i -q -r -M -S -X -F' # ugh this is broken somehow
export LESS='-F -g -i -M -R -S -w -X -z-4'

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
# Don't record an entry that was just recorded again (different to `setopt HIST_IGNORE_ALL_DUPS` which deletes old history entries if the new entry is a duplicate)
setopt HIST_IGNORE_DUPS
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS
# Don't execute immediately upon history expansion.
setopt HIST_VERIFY

# ZSH uses the KEYTIMEOUT parameter to determine how long to wait for additional characters in sequence. Default is 40 (400 ms).
KEYTIMEOUT=1 # 10 ms

# source fzf binary, completions, and keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# activate rbenv
eval "$(rbenv init -)"

# activate nvm + load completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# source yarn globals
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

function tn () {
  # new tmux session with random name
  tmux new -s "yo"
}

# work stuff, avert your gaze
export USER=$(cat ~/.intercom_username)
export INTERCOM_USER=$(cat ~/.intercom_username)
export AWS_DEFAULT_REGION="us-east-1"

# Aliases
source ~/.aliases
source ~/.aliases.priv