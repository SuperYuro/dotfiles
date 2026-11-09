# 設定ファイルをシンボリックリンクで配置する
#   make desktop  Linux GUI 環境
#   make server   開発用 Linux サーバー
#   make macbook  MacBook Air
#
# すでに実ファイル / ディレクトリがある場合は <名前>.bak.<日時> に退避してからリンクする
# fish の設定はどの環境にも配置しない

DOTFILES   := $(CURDIR)/config
CONFIG_DIR := $(HOME)/.config

COMMON  := bat btop gh git lazygit lsd mise nvim starship.toml tmux yt-dlp zsh
DESKTOP := $(COMMON) emacs fcitx5 foot mozc
SERVER  := $(COMMON)
MACBOOK := $(COMMON) alacritty emacs

# link <src> <dst>
LINK_FN = link() { \
	if [ -L "$$2" ] && [ "$$(readlink "$$2")" = "$$1" ]; then \
		echo "ok      $$2"; return; \
	fi; \
	if [ -e "$$2" ] && [ ! -L "$$2" ]; then \
		bak="$$2.bak.$$(date +%Y%m%d%H%M%S)"; \
		mv "$$2" "$$bak" && echo "backup  $$2 -> $$bak"; \
	fi; \
	ln -sfn "$$1" "$$2" && echo "link    $$2 -> $$1"; \
}

define deploy
	@mkdir -p "$(CONFIG_DIR)"
	@$(LINK_FN); \
	for name in $(1); do \
		link "$(DOTFILES)/config/$$name" "$(CONFIG_DIR)/$$name"; \
	done; \
	link "$(DOTFILES)/.zshenv" "$(HOME)/.zshenv"
endef

.PHONY: desktop server macbook

desktop:
	$(call deploy,$(DESKTOP))

server:
	$(call deploy,$(SERVER))

macbook:
	$(call deploy,$(MACBOOK))
