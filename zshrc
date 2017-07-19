export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# Theme
zplug "mafredri/zsh-async"
zplug "22a/purer"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "modules/completion", from:prezto
zplug "paulirish/git-open", as:plugin

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

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
alias gl='git log --topo-order --pretty=format:"%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B"'
alias gwd='git diff --no-ext-diff'
alias gwdc="gwd --cached"
alias gws='git status --short'
alias gco='git checkout'
alias gcm='git commit --message'
alias gc='git commit --verbose'
alias gcF='git commit --verbose --amend'
alias gcf='git commit --amend --reuse-message HEAD'
alias gb='git branch'
alias gbd="git branch -d"
alias gbD="git branch -D"

# misc
alias pyserv="python -m SimpleHTTPServer"
alias psg="ps aux | head -n 1; ps aux | rg"
alias cls="clear; ls"
alias exs="source ~/.zshrc" # happy now, Eoin?
alias brewu="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew doctor; brew prune;"

alias cask='brew cask'
alias cls='clear; ls'

alias ls='ls -Gh'
alias l='ls -1A'
alias ll='ls -lh'
alias la='ll -A'
alias lk='ll -Sr'
