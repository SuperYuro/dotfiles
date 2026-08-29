# デスクトップ/サーバーマシン用の設定ファイル配置 Makefile

DOTFILES_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SRC_DIR := $(DOTFILES_DIR)/config
HOME_DIR ?= $(HOME)

# マシンごとに配置するアプリ
DESKTOP_APPS := tmux vim btop git kitty lazygit
SERVER_APPS := tmux vim btop git lazygit
APPS := $(sort $(DESKTOP_APPS) $(SERVER_APPS))

# $HOME 直下に配置する dotfile
SRC-tmux := $(SRC_DIR)/.tmux.conf
DEST-tmux := $(HOME_DIR)/.tmux.conf

SRC-vim := $(SRC_DIR)/.vimrc
DEST-vim := $(HOME_DIR)/.vimrc

# $HOME/.config に配置する XDG 設定
SRC-btop := $(SRC_DIR)/config/btop
DEST-btop := $(HOME_DIR)/.config/btop

SRC-git := $(SRC_DIR)/config/git
DEST-git := $(HOME_DIR)/.config/git

SRC-kitty := $(SRC_DIR)/config/kitty
DEST-kitty := $(HOME_DIR)/.config/kitty

SRC-lazygit := $(SRC_DIR)/config/lazygit
DEST-lazygit := $(HOME_DIR)/.config/lazygit

.PHONY: install-desktop install-server $(addprefix install-,$(APPS)) clean

# デスクトップマシン(kitty 含む)
install-desktop: $(addprefix install-,$(DESKTOP_APPS))

# サーバーマシン(kitty 不要)
install-server: $(addprefix install-,$(SERVER_APPS))

define deploy_rule
install-$(1):
	install -d $(dir $(DEST-$(1)))
	@if [ -e "$(DEST-$(1))" ] && [ ! -L "$(DEST-$(1))" ]; then rm -rf "$(DEST-$(1))"; fi
	ln -sfn "$(SRC-$(1))" "$(DEST-$(1))"
	@echo "deployed: $(DEST-$(1)) -> $(SRC-$(1))"
endef

$(foreach app,$(APPS),$(eval $(call deploy_rule,$(app))))

clean:
	@for dest in $(foreach app,$(APPS),$(DEST-$(app))); do \
		if [ -L "$$dest" ]; then rm "$$dest" && echo "removed: $$dest"; fi; \
	done
