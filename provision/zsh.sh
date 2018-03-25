#!/bin/bash

# use brew zsh instead of bash
sudo echo '# homebrew zsh\n/usr/local/bin/zsh' >> /etc/shells
sudo chsh -s /usr/local/bin/zsh

# install zsh plugins
zsh -c "zplug install"
