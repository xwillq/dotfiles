DOTFILES := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CMD := stow --verbose --dir "$(DOTFILES)"
STOW := $(CMD) --stow

install:
	@$(STOW) --target "$(HOME)" zsh
	@$(STOW) --target "$(HOME)" git
	@$(STOW) --target "$(HOME)" nvim
	@$(STOW) --target "$(HOME)" iterm2
	@$(STOW) --target "$(HOME)" bat
	@$(STOW) --target "$(HOME)" ranger
	@$(STOW) --target "$(HOME)" karabiner
	@$(STOW) --target "$(HOME)" --no-folding bin
	@$(STOW) --target "$(HOMEBREW_PREFIX)/etc" dnscrypt-proxy
