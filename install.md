All this running on a base of macOS Sierra 10.12.1, brew had a falling out with sierra at the beginning and may do the same with future dot versions of OSX.

### CMD LINE UTILS

we need to get cmd line utils, (figure out why, http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/)

type this shit at terminal:
```bash
xcode-select --install
```
click accept- etc.

disable shitty dashboard:
```bash
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
```

hush that login message:
```bash
touch .hushlogin
```
remove all poop icons from dashboard

perhaps install the apple bits keynote,pages,etc.

### BREW
install brew:
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
---this needed sudo, password prompt

```bash
brew install neovim/neovim/neovim tmux wget ripgrep htop erlang elixir zsh git fzf python3 yarn
```

other things prev installed to look into:
asciicinema, haskell-stack, imagemagick, pandoc, postgresql, python

### CASKROOM
install caskroom:
```bash
brew tap caskroom/cask
```

install casks: dev bits
```bash
brew cask install iterm2 google-chrome firefox slack spotify dropbox alfred bartender istat-menus ngrok
```
other misc casks:
```bash
brew cask install transmission vlc tunnelblick imageoptim spectacle
```
cool quicklook sugar:
```bash
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package qlvideo
```
---this needed sudo the first time too

other apps to look for:
ps, vector magic, tuxera disk manager(for ntfs hdd shit)

### ALFRED SHORTCUT
open keyboard settings > shortcuts > spotlight
disable them all

open alfred, set hotkey to cmd + space
set apperance to macOS

### ZSH + PREZTO
```bash
zsh
```
```bash
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```
```bash
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```
```bash
chsh -s /bin/zsh
```

### TMUX Plugin Manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

tmux statusbar will be empty until tmp plugins are installed with leader + I

### VIMPLUG

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### DOTFILES

```bash
ln -sf ./zpreztorc ~/.zpreztorc
ln -sf ./zshrc ~/.zshrc
ln -sf ./tmux.conf ~/.tmux.conf
ln -sf ./nvimrc ~/.config/nvim/init.vim
```

### FONT

```bash
cd ~/Library/Fonts && curl -fLo "Sauce Code Pro Light Nerd Font Complete Mono.otf" https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/SourceCodePro/Light/complete/Sauce%20Code%20Pro%20Light%20Nerd%20Font%20Complete%20Mono.ttf
```

set font in iTerm profile

### iTerm2 Colourscheme

https://raw.githubusercontent.com/chriskempson/base16-iterm2/master/base16-spacemacs.dark.256.itermcolors

import and set colourscheme in iTerm profile

### Deoplete

```bash
pip3 install neovim
```

### NVM
```bash
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
```
```bash
nvm install stable
```

### Yarn Packages

```bash
yarn global add eslint git-open
```

-------------------------------------


NOT WORKING:
"+y inside vim in tmux
v selection with tmux-yank, perhaps tm-yank is unnecessary


### GLOBAL GITIGNORE

```bash
git config --global user.name "Your Name Here"
```
```bash
git config --global user.email "your_email@youremail.com"
```
```bash
echo ".DS_Store" > ~/.gitignore
```
then run:
```bash
git config --global core.excludesfile ~/.gitignore
```

### SSH KEYPAIR

gen a ssh keypair:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

investigate ssh-agent

### Signed Commits

https://help.github.com/articles/signing-commits-using-gpg/


### NTFS
check this shit out
there's talk of restarting mac with system integrity checks disabled, not sure about that now, worth a look though
brew cask install osxfuse
brew install homebrew/fuse/ntfs-3g
