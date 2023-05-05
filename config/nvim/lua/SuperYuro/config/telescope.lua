local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			i = {
				["<ESC>"] = actions.close,
			},
		},
	},
	extensions = {
		ctags_outline = {
			-- ctags option
			ctags = { "ctags" },
			-- ctags filesystem option
			ft_opt = {
				vim = "--vim-kinds=fk",
				lua = "--lua-kinds=fk",
			},
		},
		emoji = {
			action = function(emoji)
				vim.fn.setreg("*", emoji.value)
				print([[Press p or "*p to paste this emoji]] .. emoji.value)
				vim.api.nvim_put({ emoji.value }, "c", false, true)
			end,
		},
		file_browser = {
			hijack_netrw = true,
			mappings = {
				["i"] = {
					["<ESC>"] = actions.close,
					["<C-o>"] = require("telescope").extensions.file_browser.actions.create,
				},
			},
		},
	},
})

telescope.load_extension("software-licenses")
telescope.load_extension("emoji")
telescope.load_extension("ctags_outline")
telescope.load_extension("env")
telescope.load_extension("file_browser")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "sr", ":Telescope live_grep<CR>", opts)
vim.keymap.set("n", "sb", ":Telescope buffers<CR>", opts)
-- vim.keymap.set("n", "st", ":Telescope help_tags<CR>", opts)
-- vim.keymap.set("n", "s;", ":Telescope resume<CR>", opts)
vim.keymap.set("n", "sd", ":Telescope diagnostics<CR>", opts)
vim.keymap.set("n", "se", ":Telescope emoji<CR>", opts)
vim.keymap.set("n", "st", ":Telescope ctags_outline outline<CR>", opts)
vim.keymap.set("n", "sf", ":Telescope file_browser path=%:p:h select_buffer=true hidden=true<CR>", opts)
vim.keymap.set("n", "sw", ":Telescope software-licenses find<CR>", opts)

-- '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cws = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode = "normal", layout_config = { height = 40 } })<cr>',
