local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = false,
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		-- modified_icon = 'M',
		-- close_icon = 'x',
		-- left_trunc_marker = '<',
		-- right_trunc_marker = '>',
	},
	highlights = {
		separator = {
			fg = "#dcdfe7", -- normal black
			bg = "#e8e9ec", -- background
		},
		separator_selected = {
			fg = "#dcdfe7", -- normal black
		},
		background = {
			fg = "#d2d4de", -- light theme foreground
			bg = "#e8e9ec", -- background
		},
		buffer_selected = {
			fg = "#161821", -- light theme background
		},
		fill = {
			bg = "#dcdfe7", -- normal black
			underline = true,
			undercurl = true,
			italic = true,
			bold = true,
		},
	},
})

vim.api.nvim_set_keymap("n", "tn", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "tp", "<cmd>BufferLineCyclePrev<cr>", {})
