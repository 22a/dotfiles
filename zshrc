#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export FZF_DEFAULT_COMMAND='rg -l ""'

# iterm2 colours
BASE16_SHELL="$HOME/.config/base16-shell/base16-google.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#aliases
alias pyserv="python -m SimpleHTTPServer"
alias irbs="irb --simple-prompt"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias emacs="nvim"
alias tn="tmux new -s"
alias tls="tmux ls"
alias ta="tmux a"
alias psg="ps aux | grep"
alias cls="clear; ls"
