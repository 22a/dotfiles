#!/bin/bash

# use brew zsh instead of bash
echo '# homebrew zsh\n/usr/local/bin/zsh' >> /etc/shells
chsh -s /usr/local/bin/zsh

# install zsh plugins
zplug install
