local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed!")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use({ "wbthomason/packer.nvim", run = ":PackerUpdate" })
	use({
		"bluz71/vim-moonfly-colors",
		as = "moonfly",
		config = vim.cmd([[colorscheme moonfly]]),
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
	})
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("L3MON4D3/LuaSnip") -- Snippet
	use("onsails/lspkind-nvim") -- Pictograms
	use("hrsh7th/cmp-buffer") -- Completion source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- Completion source for built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion
	use("neovim/nvim-lspconfig") -- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("numToStr/Comment.nvim")
	use("kylechui/nvim-surround")
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("akinsho/nvim-bufferline.lua")
	use("norcalli/nvim-colorizer.lua")
	use("tpope/vim-fugitive")
	use("preservim/tagbar") -- Show tagbar
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
	-- use("MunifTanjim/prettier.nvim") -- Prettier plugin for Neovim's built-in LSP client
end)
