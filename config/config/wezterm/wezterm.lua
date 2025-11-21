-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

if wezterm.target_triple:find("linux") then
	-- config.default_prog = { "/usr/bin/fish", "--login", "--interactive" }
	config.default_prog = { "fish", "--login", "--interactive" }
elseif wezterm.target_triple:find("darwin") then
	config.default_prog = { "/opt/homebrew/bin/fish", "--login", "--interactive" }
end

config.initial_cols = 200
config.initial_rows = 50

config.font = wezterm.font_with_fallback({ "PlemolJP Console NF", "Noto Color Emoji" })
config.font_size = 13

config.color_scheme = "Catppuccin Frappe"

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.enable_tab_bar = true
config.tab_bar_at_bottom = true

-- すべてのデフォルトキーバインディングを無効化
config.disable_default_key_bindings = true

-- クリップボード関連のキーバインディングのみを明示的に設定
config.keys = {
	-- コピー (macOS)
	{
		key = "c",
		mods = "SUPER",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	-- ペースト (macOS)
	{
		key = "v",
		mods = "SUPER",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- コピー (Windows/Linux)
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	-- ペースト (Windows/Linux)
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- プライマリセレクションへのコピー (Linux)
	{
		key = "Insert",
		mods = "CTRL",
		action = wezterm.action.CopyTo("PrimarySelection"),
	},
	-- プライマリセレクションからのペースト (Linux)
	{
		key = "Insert",
		mods = "SHIFT",
		action = wezterm.action.PasteFrom("PrimarySelection"),
	},

	-- ========================================
	-- ウィンドウ操作
	-- ========================================
	-- 新しいウィンドウを作成 (macOS)
	{
		key = "n",
		mods = "SUPER",
		action = wezterm.action.SpawnWindow,
	},
	-- 新しいウィンドウを作成 (Windows/Linux)
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnWindow,
	},

	-- ========================================
	-- タブ操作
	-- ========================================
	-- 新しいタブを作成 (macOS)
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	-- 新しいタブを作成 (Windows/Linux)
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	-- タブを閉じる (macOS)
	{
		key = "w",
		mods = "SUPER",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},
	-- タブを閉じる (Windows/Linux)
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- 前のタブへ移動 (macOS)
	{
		key = "[",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- 次のタブへ移動 (macOS)
	{
		key = "]",
		mods = "SUPER|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- 前のタブへ移動 (Windows/Linux)
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "PageUp",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- 次のタブへ移動 (Windows/Linux)
	{
		key = "Tab",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "PageDown",
		mods = "CTRL",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- ========================================
	-- デバッグ・便利機能 (推奨)
	-- ========================================
	-- デバッグオーバーレイ
	{
		key = "L",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ShowDebugOverlay,
	},
	-- コマンドパレット
	{
		key = "P",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ActivateCommandPalette,
	},
}

return config
