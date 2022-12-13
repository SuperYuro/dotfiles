local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		separator_style = "thin",
		always_show_bufferline = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		-- modified_icon = "●",
		-- close_icon = "",
		-- left_trunc_marker = "",
		-- right_trunc_marker = "",
		modified_icon = "M",
		close_icon = "x",
		left_trunc_marker = "<",
		right_trunc_marker = ">",
	},
	highlights = {
		separator = {
			fg = "#d0cfcc", -- normal black
			bg = "#ffffff", -- background
		},
		separator_selected = {
			fg = "#d0cfcc", -- normal black
		},
		background = {
			fg = "#d0cfcc", -- light theme foreground or bright black
			bg = "#ffffff", -- background
		},
		buffer_selected = {
			fg = "#171421", -- light theme background or bright white
		},
		fill = {
			bg = "#d0cfcc", -- normal black
			underline = true,
			undercurl = true,
			italic = true,
			bold = true,
		},
	},
})

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
