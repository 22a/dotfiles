![snoopWoop](https://upload.wikimedia.org/wikipedia/commons/3/37/Female_dalmatian_head_shot.jpg)
# Dotfiles
### aka. Spooky Wizzard Incantation Configuration

My spooky configuration of zsh, prezto, tmux, and neovim.

## Prerequisites

These dotfiles have been designed solely for neovim in iTerm2 on macOS. For \*nix / regular vim support check out the [linus branch](https://github.com/22a/dotfiles/tree/linus).

## Warnings

The install script has been setup with a fresh macOS install in mind, it assumes a blank canvas. **It will forcably symlink over your dotfiles** if you let it.

I have tested this on macOS Sierra 10.12.1, brew had a falling out with sierra at the beginning and may do the same with future versions of OSX.


## Installation

Install the xcode command line tools:
```bash
xcode-select --install
```
Click accept, accept, etc.

Clone this repo:
```bash
git clone git@github.com:22a/dotfiles.git
```

Run the install scripts:
```bash
cd dotfiles; make
```

### Other misc bits that haven't been automated yet:

* Configure iTerm2 font + colourscheme
* git config

### Things to do manually
* gen ssh keys, configure ssh-agent keychain stuff
* disable spotlight keyboard shortcuts
* set alfred keyboard shortcuts
* remove shit from dock, add useful things


# More readme bits + screenshots coming soon.
