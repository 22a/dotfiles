#!/bin/bash

provision_dir=$(dirname "$0")

bash -x "$provision_dir/brew.sh"
bash -x "$provision_dir/brewfile.sh"
bash -x "$provision_dir/zsh.sh"
bash -x "$provision_dir/nvm.sh"
bash -x "$provision_dir/neovim.sh"
bash -x "$provision_dir/symlinks.sh"
bash -x "$provision_dir/macos.sh"
