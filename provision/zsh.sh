#!/bin/bash

# use brew zsh instead of bash
echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh

# install zsh plugins
zsh -c "source ~/.zshrc"
