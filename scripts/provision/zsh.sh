#!/bin/bash

# use brew zsh instead of macos default zsh
which zsh | sudo tee -a /etc/shells
chsh -s "$(which zsh)"
