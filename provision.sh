#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# update existing `sudo` time stamp until `provision.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo bash -x provision/brew.sh
sudo bash -x provision/zsh.sh
bash -x provision/neovim.sh
bash -x provision/symlinks.sh
bash -x provision/macos.sh
