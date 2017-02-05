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

# source yarn globals
export PATH="$PATH:`yarn global bin`"

# Speedy Esc
KEYTIMEOUT=1

tn () {
  tmux new -s $(~/dotfiles/scripts/random_word.sh)
}

# Aliases
alias pyserv="python -m SimpleHTTPServer"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"
alias tns="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias tk="tmux kill-session -t"
alias psg="ps aux | grep"
alias cls="clear; ls"
alias exs="exec $SHELL"
alias brewu="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor;"
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias digg="dig +nocmd any +multiline +noall +answer"
