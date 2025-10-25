-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

if wezterm.target_triple:find("linux") then
	config.default_prog = { "/usr/bin/fish", "--login", "--interactive" }
elseif wezterm.target_triple:find("darwin") then
	config.default_prog = { "/opt/homebrew/bin/fish", "--login", "--interactive" }
end

config.initial_cols = 200
config.initial_rows = 50

config.font = wezterm.font_with_fallback({ "PlemolJP Console NF", "Noto Color Emoji" })
config.font_size = 12

config.color_scheme = "Catppuccin Frappe"

config.use_fancy_tab_bar = true
config.enable_tab_bar = false

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
}

return config
