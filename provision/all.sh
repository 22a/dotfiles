#!/bin/bash

bash -x provision/brew.sh
bash -x provision/brewfile.sh
bash -x provision/zsh.sh
bash -x provision/zplug.sh
bash -x provision/fzf.sh
bash -x provision/neovim.sh
bash -x provision/symlinks.sh
bash -x provision/macos.sh
