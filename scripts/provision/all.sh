#!/bin/bash

provision_dir=$(dirname "$0")

bash -x "$provision_dir/brew.sh"
bash -x "$provision_dir/brewfile.sh"
bash -x "$provision_dir/zsh.sh"
bash -x "$provision_dir/fzf.sh"
bash -x "$provision_dir/neovim.sh"
bash -x "$provision_dir/symlinks.sh"
bash -x "$provision_dir/zplug.sh"
bash -x "$provision_dir/vimplug.sh"
bash -x "$provision_dir/macos.sh"
