.PHONY: all brew-install homebrew hushlogin mac-bits nvim vim-plug zplug zsh spacemacs

.SILENT: all brew-install homebrew hushlogin mac-bits nvim vim-plug zplug zsh spacemacs

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: homebrew brew-install hushlogin mac-bits nvim vim-plug zplug zsh
	@printf "You're all set\n"

mac-bits:
	defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

homebrew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew-install:
	brew bundle

vim-plug:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vs-code:
	defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

dotfiles:
	touch $(HOME)/.hushlogin
	touch $(HOME)/.priv_aliases
	mkdir -p $(HOME)/.config/nvim
	mkdir -p $(HOME)/.config/git
	ln -sf $(ROOT_DIR)/nvimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile
	ln -sf $(ROOT_DIR)/aliases.zsh $(HOME)/.aliases
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(ROOT_DIR)/gitconfig $(HOME)/.config/git/config
	ln -sf $(ROOT_DIR)/gitignore $(HOME)/.config/git/ignore

nvim:
	pip3 install neovim
	nvim -c PlugInstall -c quitall

zsh:
	sudo sh -c "echo '# homebrew zsh\n/usr/local/bin/zsh' >> /etc/shells"
	chsh -s /usr/local/bin/zsh

zplug:
	zplug install
