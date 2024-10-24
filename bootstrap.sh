#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

all () {
  homebrew;
  brewfile;
  shell;
  symlinks;
}

brewfile () {
  exit_if_brew_not_on_path;
  # disable analytics
  brew analytics off
  # install our brew bundle from ./Brewfile
  brew bundle
}

exit_if_brew_not_on_path () {
  if ! command -v brew &> /dev/null; then
    RED='\033[0;31m'
    NC='\033[0m'
    error_msg="brew isn't available on your \$PATH, this means the rest of the install won't work."
    suggested_fix_msg="
    look at the output logs when you installed homebrew, it probably asked you to do something.

    when you think it's fixed, it is safe to run this script with the --all flag again.
    "
    echo -e "\n${RED}$error_msg${NC}\n$suggested_fix_msg\n"
    exit 1;
  fi
}

homebrew () {
  # if `brew` isn't already on path
  if ! command -v brew &> /dev/null; then
    # install homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

symlinks () {
  touch ~/.hushlogin
  touch ~/.aliases.priv

  ln -sf "$SCRIPT_DIR/aliases"        ~/.aliases
  ln -sf "$SCRIPT_DIR/gitconfig"      ~/.gitconfig
  ln -sf "$SCRIPT_DIR/tmux.conf"      ~/.tmux.conf
  ln -sf "$SCRIPT_DIR/vimrc"          ~/.vimrc
  ln -sf "$SCRIPT_DIR/zimrc"          ~/.zimrc
  ln -sf "$SCRIPT_DIR/zshrc"          ~/.zshrc
}

shell () {
  # use brew zsh instead of macos default zsh
  which zsh | sudo tee -a /etc/shells
  chsh -s "$(which zsh)"
}

case "$1" in
  --all) all;;
  --brewfile) brewfile;;
  --homebrew) homebrew;;
  --shell) shell;;
  --symlinks) symlinks;;
  *) echo "unexpected arg: $1"; exit 1;;
esac

exit 0;
