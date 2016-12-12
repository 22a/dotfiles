# source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# source NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use rg for fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

# Speedy Esc
KEYTIMEOUT=1

# Aliases
alias pyserv="python -m SimpleHTTPServer"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"
alias tn="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias psg="ps aux | grep"
alias cls="clear; ls"
alias exs="exec $SHELL"
