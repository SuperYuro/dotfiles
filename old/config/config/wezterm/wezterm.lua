-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.initial_cols = 200
config.initial_rows = 50

config.font = wezterm.font_with_fallback({ "PlemolJP Console NF", "Noto Color Emoji" })

config.color_scheme = "Catppuccin Frappe"

config.use_ime = true

config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.75

config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false
config.show_tab_index_in_tab_bar = false

config.window_frame = {
	font = wezterm.font({ family = "PlemolJP NF", weight = "Bold" }),
	font_size = 12.0,
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

config.window_background_gradient = {
	colors = { "#303446" },
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
}

local tab_left = wezterm.nerdfonts.ple_lower_right_triangle
local tab_right = wezterm.nerdfonts.ple_lower_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#303446"
	local foreground = "#c6d0f5"
	local edge_background = "none"

	if tab.is_active then
		background = "#8caaee"
		foreground = "#303446"
	end

	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = tab_left },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = tab_right },
	}
end)

-- すべてのデフォルトキーバインディングを無効化
config.disable_default_key_bindings = true

-- クリップボード関連のキーバインディングのみを明示的に設定
if wezterm.target_triple:find("linux") then
	config.default_prog = { "/usr/bin/fish", "--login", "--interactive" }
	config.font_size = 13

	config.keys = {
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
		-- 新しいウィンドウを作成 (Windows/Linux)
		{
			key = "n",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnWindow,
		},
		-- ========================================
		-- タブ操作
		-- ========================================
		-- 新しいタブを作成 (Windows/Linux)
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnTab("CurrentPaneDomain"),
		},
		-- タブを閉じる (Windows/Linux)
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
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
elseif wezterm.target_triple:find("darwin") then
	config.default_prog = { "/opt/homebrew/bin/fish", "--login", "--interactive" }
	config.font_size = 15

	config.integrated_title_button_style = "MacOsNative"

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
		-- ========================================
		-- ウィンドウ操作
		-- ========================================
		-- 新しいウィンドウを作成 (macOS)
		{
			key = "n",
			mods = "SUPER",
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
		-- タブを閉じる (macOS)
		{
			key = "w",
			mods = "SUPER",
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
	}
end

return config
