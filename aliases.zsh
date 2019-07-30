# neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"
alias ctrlp="nvim \$(fzf --preview 'bat --style=plain --color=always {}')"

# tmux
alias tns="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias tks="tmux kill-session -t"

# tree
alias tree="tree -a -I 'node_modules*|.git*'"

# flush dns cache
alias dns="sudo killall -hUP mDNSResponder"

# dig wrappers
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias digg="dig +nocmd any +multiline +noall +answer"

# curly
alias hd="curl -s -I"

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

# git branch
alias gp="git push"
alias gl="git pull"
alias gb="git branch"
# git branch current
alias gbc="git branch | grep \* | cut -d ' ' -f2"
# git branch set upstream
alias gbsu="git branch --set-upstream-to=origin/\$(gbc) \$(gbc)"
# git branch delete
alias gbd="gb -d"
# git branch delete forcefully
alias gbD="gb -D"
# git branch delete interactive
alias gbdi="gb | fzf -m | xargs git branch -d"
# git branch delete interactive forcefully
alias gbDi="gb | fzf -m | xargs git branch -D"
# git commit
alias gc="git commit --verbose"
# git commit amend
alias gcam="gc --amend"
# git commit amend force
alias gcf="gcam --reuse-message HEAD"
# git commit message
alias gcm="git commit --message"
# git checkout
alias gco="git checkout"
# git checkout branch interactive
alias gcoi="gb | fzf -m | xargs git checkout"
# git log
alias gl="git log --topo-order --pretty=format:'%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B'"
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
# git diff
alias gd="git diff --no-ext-diff --patch-with-stat"
# git diff cached
alias gdc="gwd --cached"
# git status
alias gs="git status --short"
# git set remote
alias gsr="git remote set-url origin"
# git merge master
alias gmm="gco master; git pull; gco -; git merge master --no-edit"

# old aliases that I need to ween myself off
alias gws="echo \"######## NOPE, try 'gs' instead\"; echo;"
alias gwd="echo \"######## NOPE, try 'gd' instead\"; echo;"
alias gwdc="echo \"######## NOPE, try 'gdc' instead\"; echo;"


alias cl="clear"

# misc
alias brewu="brew update; brew upgrade --force-bottle; brew cleanup --prune-prefix; brew doctor"
alias cls="clear; ls"
alias exs="source ~/.zshrc"
alias hosts="sudo $EDITOR /etc/hosts"
alias psg="ps aux | head -n 1; ps aux | rg"
alias pyserv="python3 -m http.server"
alias j="z"
alias fix="git diff --name-only | uniq | xargs $EDITOR"

# clumsy fingers
alias ..="cd .."
alias cd..="cd .."

# brew cask
alias cask="brew cask"

# listing
alias ls="gls -Fh --color --group-directories-first"
alias l="ls -1A"
alias la="ls -lA"
alias ll="la"
alias lk="la -S"

# ripgrep
alias rg="rg --smart-case"

# dotfile editing
alias nvimrc="$EDITOR ~/dotfiles/nvimrc"
alias zshrc="$EDITOR ~/dotfiles/zshrc"

alias s="script/server"
alias sup="script/update"
alias t="script/test"
alias tf="t --filter"
alias tsf="t --server --filter"
alias etf="ember test --filter"
alias etsf="ember test --server --filter"
alias n="git pull; sup; s"
alias ys="yarn install --check-files; rm -rf tmp dist; ember s"
alias nif="git check-ignore * | tr '\\n' ' ' | xargs rm -rf"

alias percy="perl -pi -e \"s/RUN_PERCY=''/RUN_PERCY='true'/g\" .env; git add .env; gcm \"run percy\"; git push; git revert HEAD --no-edit; git push;"
