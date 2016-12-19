.PHONY: all mac-bits hushlogin brew dev-brews caskroom dev-casks other-casks yarn-globals font prezto vim-plug dotfiles nvim tmux-plugins nvm node
.SILENT: all mac-bits hushlogin brew dev-brews caskroom dev-casks other-casks yarn-globals font prezto vim-plug dotfiles nvim tmux-plugins nvm node

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: mac-bits hushlogin brew dev-brews caskroom dev-casks other-casks yarn-globals font prezto vim-plug dotfiles nvim tmux-plugins nvm node
	@printf "You're all set\n"

mac-bits:
	defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

hushlogin:
	touch $(HOME)/.hushlogin

brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

dev-brews:
	brew install neovim/neovim/neovim tmux wget ripgrep htop erlang elixir zsh git fzf python3 yarn

caskroom:
	brew tap caskroom/cask

dev-casks:
	brew cask install iterm2 google-chrome firefox slack spotify dropbox alfred bartender istat-menus ngrok

other-casks:
	brew cask install transmission vlc tunnelblick imageoptim spectacle

yarn-globals:
	yarn global add eslint git-open

font:
	cp $(ROOT_DIR)/theme/Sauce\ Code\ Pro\ Light\ Nerd\ Font\ Complete\ Mono.ttf $(HOME)/Library/Fonts/

prezto:
	touch $(HOME)/.zshrc
	echo 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "$${ZDOTDIR:-$$HOME}/.zprezto";\
		setopt EXTENDED_GLOB;\
		for rcfile in "$${ZDOTDIR:-$$HOME}"/.zprezto/runcoms/^README.md(.N); do;\
		ln -sf "$$rcfile" "$${ZDOTDIR:-$$HOME}/.$${rcfile:t}";\
		done;\
		exit 0' | zsh
	chsh -s /bin/zsh

vim-plug:
	curl -fLo $(HOME)/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

dotfiles:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(ROOT_DIR)/nvimrc $(HOME)/.config/nvim/init.vim
	ln -sf $(ROOT_DIR)/zpreztorc $(HOME)/.zpreztorc
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf

nvim:
	pip3 install neovim
	nvim -c PlugInstall -c quitall

tmux-plugins:
	if [ ! -d "$(HOME)/.tmux/plugins/tpm" ]; then \
		git clone https://github.com/tmux-plugins/tpm $(HOME)/.tmux/plugins/tpm; \
		$(HOME)/.tmux/plugins/tpm/bin/install_plugins; \
	fi

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

node:
	export NVM_DIR="$$HOME/.nvm"
	[ -s "$$NVM_DIR/nvm.sh" ] && . "$$NVM_DIR/nvm.sh"
	nvm install stable
