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
		-- modified_icon = "M",
		-- close_icon = "x",
		-- left_trunc_marker = "<",
		-- right_trunc_marker = ">",
	},
	highlights = {
		separator = {
			fg = "#191e2a", -- normal black
			bg = "#202734", -- background
		},
		separator_selected = {
			fg = "#191e2a", -- normal black
		},
		background = {
			fg = "#686868", -- light theme foreground or bright black
			bg = "#202734", -- background
		},
		buffer_selected = {
			fg = "#ffffff", -- light theme background or bright white
		},
		fill = {
			bg = "#191e2a", -- normal black
			underline = true,
			undercurl = true,
			italic = true,
			bold = true,
		},
	},
})

vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
