ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all:
	@printf "Makefile targets: \n\n"
	@printf "\tmac\t\t - install all for mac\n"
	@printf "\tserver\t\t - install all for unix based server\n"
	@printf "\tzsh\t\t - install zsh\n"
	@printf "\tzprezto\t\t - install zprezto\n"
	@printf "\tvim\t\t - install vim\n"
	@printf "\ttmux\t\t - install tmux\n"
	@printf "\tghci\t\t - install ghci\n"
	@printf "\thelp\t\t - print this message\n"

mac: zprezto zsh vim tmux ghc
server: bash vim tmux ghc
.PHONY: vim zsh zprezto

bash:
	ln -sf $(ROOT_DIR)/bashrc $(HOME)/.bashrc

zsh:
	ln -sf $(ROOT_DIR)/zshrc $(HOME)/.zshrc
	ln -sf $(ROOT_DIR)/zshenv $(HOME)/.zshenv
	ln -sf $(ROOT_DIR)/zprofile $(HOME)/.zprofile

zprezto:
	zsh
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
	setopt EXTENDED_GLOB
		for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
		ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	done
	chsh -s /bin/zsh
	ln -sf $(ROOT_DIR)/zpreztorc $(HOME)/.zpreztorc

vim:
	ln -sf $(ROOT_DIR)/vimrc $(HOME)/.vimrc
	rm -rf ~/.vim
	cp -r $(ROOT_DIR)/vim $(HOME)/.vim
	vim -c PlugInstall -c quitall

tmux:
	ln -sf $(ROOT_DIR)/tmux.conf $(HOME)/.tmux.conf

ghc:
	ln -sf $(ROOT_DIR)/ghci $(HOME)/.ghci

help: all
