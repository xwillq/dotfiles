DOTFILES := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
STOW := stow --verbose --dir "$(DOTFILES)" --target "$(HOME)" --dotfiles

install: init
	$(STOW) --stow .

uninstall:
	$(STOW) --delete .

init: create-dirs

create-dirs: iterm2 karabiner bin zsh

iterm2 karabiner:
	mkdir -p $(HOME)/.config/$@

bin:
	mkdir -p $(HOME)/.local/bin

zsh:
	mkdir -p $(HOME)/.local/share/zsh
