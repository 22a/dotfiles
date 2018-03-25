#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# update existing `sudo` time stamp until `provision.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for file in $PWD/provision/*; do
  [ -f "$file" ] && [ -x "$file" ] && "$file"
done
