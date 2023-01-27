local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "slant",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
	},
	highlights = {
		separator = {
			fg = "#073642", -- normal black
			bg = "#002b36", -- background
		},
		separator_selected = {
			fg = "#073642", -- normal black
		},
		background = {
			fg = "#657b83", -- light theme foreground or bright black
			bg = "#002b36", -- background
		},
		buffer_selected = {
			fg = "#fdf6e3", -- light theme background or bright white
		},
		fill = {
			bg = "#073642", -- normal black
			underline = true,
			undercurl = true,
			italic = true,
			bold = true,
		},
	},
})

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
