DOTFILES := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

CMD := stow --verbose --dir "$(DOTFILES)"
STOW := $(CMD) --stow
UNSTOW := $(CMD) --delete -n

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

uninstall:
	@$(UNSTOW) --target "$(HOME)" zsh
	@$(UNSTOW) --target "$(HOME)" git
	@$(UNSTOW) --target "$(HOME)" nvim
	@$(UNSTOW) --target "$(HOME)" iterm2
	@$(UNSTOW) --target "$(HOME)" bat
	@$(UNSTOW) --target "$(HOME)" ranger
	@$(UNSTOW) --target "$(HOME)" karabiner
	@$(UNSTOW) --target "$(HOME)" --no-folding bin
	@$(UNSTOW) --target "$(HOMEBREW_PREFIX)/etc" dnscrypt-proxy
