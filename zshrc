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

# new tmux session with random name
tn () {
  tmux new -s $(~/dotfiles/scripts/random_word.sh)
}

# Aliases

# editors
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"

# tmux
alias tns="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias tks="tmux kill-session -t"

# internet
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias digg="dig +nocmd any +multiline +noall +answer"

# docker
alias dps="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsa="docker ps -a --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsq="docker ps -q"
alias dpsaq="docker ps -a -q"
alias dpsl="docker ps"
alias dpsal="docker ps -a"
alias dim="docker images"
alias drmi="docker rmi"
alias drmiA="docker rmi \$(docker images -q)"
alias drm="docker rm"
alias dsA="docker stop \$(docker ps -a -q)"
alias drmA="docker rm \$(docker ps -a -q)"
alias drmAf="docker rm -f \$(docker ps -a -q)"
alias da="docker attach"
alias dprune="docker system prune --all"

# git
alias gpull="git pull"
alias gpush="git push"
alias gpusho="git push && git open"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gwdc="gwd --cached"

# misc
alias pyserv="python -m SimpleHTTPServer"
alias psg="ps aux | head -n 1; ps aux | rg"
alias cls="clear; ls"
alias exs="source ~/.zshrc" # happy now, Eoin?
alias brewu="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew doctor; brew prune;"
