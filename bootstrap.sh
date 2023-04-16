#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

all () {
  echo "$SCRIPT_DIR"
  echo all;
}

brewfile () {
  echo brewfile;
  # # install our brew bundle (`Brewfile`)
  # brew bundle
}

homebrew () {
  echo homebrew;
  # # install homebrew
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  #
  # # disable analytics
  # brew analytics off
}

neovim () {
  echo neovim;
  # git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  # # install neovim python module
  # pip3 install neovim
}

nvm () {
  echo nvm;
  # # install node version manager
  # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
}

rbenv () {
  echo rbenv;
}

symlinks () {
  echo symlinks;
  # touch ~/.hushlogin
  # touch ~/.aliases.priv
  # mkdir -p ~/.config/nvim/lua/user
  #
  # ln -sf "$SCRIPT_DIR/aliases"      ~/.aliases
  # ln -sf "$SCRIPT_DIR/gitconfig"    ~/.gitconfig
  # ln -sf "$SCRIPT_DIR/init.lua"     ~/.config/nvim/lua/user/init.lua
  # ln -sf "$SCRIPT_DIR/lockfile.lua" ~/.config/nvim/lua/lazy_snapshot.lua
  # ln -sf "$SCRIPT_DIR/tmux.conf"    ~/.tmux.conf
  # ln -sf "$SCRIPT_DIR/zimrc"        ~/.zimrc
  # ln -sf "$SCRIPT_DIR/zshrc"        ~/.zshrc
}

shell () {
  echo shell;
  # # use brew zsh instead of macos default zsh
  # which zsh | sudo tee -a /etc/shells
  # chsh -s "$(which zsh)"
}

case "$1" in
  --all) all;;
  --brewfile) brewfile;;
  --homebrew) homebrew;;
  --neovim) neovim;;
  --nvm) nvm;;
  --rbenv) rbenv;;
  --shell) shell;;
  --symlinks) symlinks;;
  *) echo "unexpected arg: $1"; exit 1;;
esac

exit 0;
