# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
  *)
    ;;
esac

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}

parse_git_dirty() {
  if [[ $(git status 2> /dev/null | tail -n1) == "nothing to commit, working directory clean" ]]; then
    echo '\[\e[01;32m\]\342\234\223'
  elif [[ $(git status 2> /dev/null | tail -n1) == "no changes added to commit (use \"git add\" and/or \"git commit -a\")" ]]; then
    echo '\[\e[01;31m\]\342\234\227'
  else
    echo '\[\e[01;93m\]\342\200\274'
  fi
}

set_prompt () {
    Blue='\[\e[01;34m\]'
    White='\[\e[01;37m\]'
    Red='\[\e[01;31m\]'
    Green='\[\e[01;32m\]'
    Reset='\[\e[00m\]'
    FancyX='\342\234\227'
    Checkmark='\342\234\223'

    # If root, just print the host in red. Otherwise, print the current user
    # and host in green.
    PS1=""
    if [[ $EUID == 0 ]]; then
        PS1+="$Red\\h"
    else
        PS1+="$Blue\\u"
    fi

    PS1+="$White in "

    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+="$Green\\w"
    if [ -n "$(parse_git_branch)" ]; then
      PS1+="$White on "
      PS1+="$Blue$(parse_git_branch)"
      PS1+="$(parse_git_dirty)"
    else
      PS1+=" "
    fi
    PS1+=" $Red\\\$$Reset "
}
PROMPT_COMMAND='set_prompt'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi


alias v='vim'
alias vi='vim'
alias l='ls -alh'
alias la='ls -A'
alias lt='ls -alrth'
alias ll='ls -alF'
alias irbs='irb --simple-prompt'
alias mkdir="mkdir -p -v" #create parents verbosely
alias psg="ps aux | grep "
alias tmns="tmux new -s"
