# neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"
alias ctrlp="nvim \$(fzf --preview 'head -100 {}')"

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
# git working diff
alias gwd="git diff --no-ext-diff --patch-with-stat"
# git working diff cached
alias gwdc="gwd --cached"
# git working status
alias gws="git status --short"
# git pull all
alias gpa="gls | xargs -P8 -I{} sh -c 'git -C {} pull --all && git -C {} checkout master; git -C {} pull; git -C {} checkout stable; git -C {} pull; echo {}'"
# git set remote
alias gsr="git remote set-url origin"
# git merge master
alias gmm="gco master; git pull; gco -; git merge master --no-edit"

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
alias n="git pull; sup; s"
