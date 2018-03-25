#!/bin/bash

# use brew zsh instead of bash
sudo tee -a /etc/shells < '/usr/local/bin/zsh'
chsh -s /usr/local/bin/zsh

# install zsh plugins
zsh -c "source ~/.zshrc"
