# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

#rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

#prezto prompt save
autoload -Uz promptinit
promptinit
prompt nicoulaj

#aliases
alias pyserv="python -m SimpleHTTPServer"
alias irbs="irb --simple-prompt"
alias v="mvim -v"
alias vi="mvim -v"
alias vim="mvim -v"
alias emacs="mvim -v"

# fzf'ing
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
