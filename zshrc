# zplug directory created by brew
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mafredri/zsh-async"
zplug "22a/purer"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "modules/completion", from:prezto
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "paulirish/git-open", as:plugin
zplug "djui/alias-tips"
zplug "rupa/z", use:z.sh

if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load # --verbose

# up and down arrows for history substring search
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# vi mode?
bindkey -v

# command history please
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY # share history between sessions
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_REDUCE_BLANKS

# 10ms escape
KEYTIMEOUT=1

# source NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# source FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
# use rg for fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*'"

# mysql
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# source yarn globals
export PATH="$PATH:`yarn global bin`"
# pls yarn
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

# source local executables
export PATH="$PATH:$HOME/.local/bin"

# rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# new tmux session with random name
tn () {
  tmux new -s $(~/dotfiles/scripts/random_word.sh)
}

# Aliases

# editors
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="open -a Emacs"

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
alias dns="sudo killall -hUP mDNSResponder"

# docker
alias dim="docker images"
alias dprune="docker system prune --all"
alias dps="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsa="docker ps -a --format \"table {{.Names}}\t{{.Status}}\t{{.ID}}\t{{.Ports}}\""
alias dpsal="docker ps -a"
alias dpsl="docker ps"
alias drm="docker rm"
alias drmA="docker rm \$(docker ps -a -q)"
alias drmAf="docker rm -f \$(docker ps -a -q)"
alias drmi="docker rmi"
alias drmiA="docker rmi \$(docker images -q)"
alias dsA="docker stop \$(docker ps -a -q)"

# git
alias gb="git branch"
alias gbD="gb -D"
alias gbd="gb -d"
alias gc="git commit --verbose"
alias gcam="gc --amend"
alias gcf="gcam --reuse-message HEAD"
alias gcm="git commit --message"
alias gco="git checkout"
alias gl="git log --topo-order --pretty=format:'%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias gwd="git diff --no-ext-diff --patch-with-stat"
alias gwdc="gwd --cached"
alias gws="git status --short"
alias gpa="gls | xargs -P8 -I{} sh -c 'git -C {} pull --all && git -C {} checkout master; git -C {} pull; git -C {} checkout stable; git -C {} pull; echo {}'"

# misc
alias brewu="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew doctor; brew prune;"
alias cls="clear; ls"
alias exs="source ~/.zshrc"
alias hosts="sudo $EDITOR /etc/hosts"
alias psg="ps aux | head -n 1; ps aux | rg"
alias pyserv="python3 -m http.server"
alias j="z"

# clumsy fingers
alias ..="cd .."
alias cd..="cd .."

# brew
alias cask="brew cask"

# listing
alias ls="gls -Fh --color --group-directories-first"
alias l="ls -1A"
alias la="ls -lA"
alias ll="la"
alias lk="la -S"

# dotfile editing
alias nvimrc="$EDITOR ~/dotfiles/nvimrc"
alias zshrc="$EDITOR ~/dotfiles/zshrc"
