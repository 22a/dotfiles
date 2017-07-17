export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async"
zplug "dfurnes/purer"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/colored-man-pages", from:oh-my-zsh
# zplug "plugins/docker", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

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

# tree
alias tree="tree -a -I 'node_modules*|.git*'"

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
