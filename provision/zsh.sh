#!/bin/bash

# use brew zsh instead of bash
sudo bash -c "echo '\n# homebrew zsh\n/usr/local/bin/zsh' >> /etc/shells"
chsh -s /usr/local/bin/zsh

# install zsh plugins
zsh -c "zplug install"
