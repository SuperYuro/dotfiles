local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		mappings = {
			i = {
				["<ESC>"] = actions.close,
			},
		},
	},
})

local opts = { noremap = true, silent = true}
vim.keymap.set("n", "sr", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "sb", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "st", ":Telescope help_tags<CR>", opts)
vim.keymap.set("n", "s;", ":Telescope resume<CR>", opts)
vim.keymap.set("n", "se", ":Telescope diagnostics<CR>", opts)
vim.keymap.set(
	"n",
	"sf",
	'<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cws = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } })<cr>',
	opts
)
