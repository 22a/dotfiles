#!/bin/bash

touch ~/.hushlogin
touch ~/.priv_aliases
mkdir -p ~/.config/nvim
mkdir -p ~/.config/git
ln -sf $PWD/nvimrc ~/.config/nvim/init.vim
ln -sf $PWD/zshrc ~/.zshrc
ln -sf $PWD/zshenv ~/.zshenv
ln -sf $PWD/zprofile ~/.zprofile
ln -sf $PWD/aliases.zsh ~/.aliases
ln -sf $PWD/tmux.conf ~/.tmux.conf
