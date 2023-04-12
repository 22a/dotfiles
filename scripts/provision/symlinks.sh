#!/bin/bash

touch ~/.hushlogin
touch ~/.aliases.priv
mkdir -p ~/.config/nvim/lua/user

ln -sf "$PWD/zshrc"              ~/.zshrc
ln -sf "$PWD/zimrc"              ~/.zimrc
ln -sf "$PWD/aliases.zsh"        ~/.aliases
ln -sf "$PWD/tmux.conf"          ~/.tmux.conf
ln -sf "$PWD/gitconfig"          ~/.gitconfig
ln -sf "$PWD/astronvim-init.lua" ~/.config/nvim/lua/user/init.lua
