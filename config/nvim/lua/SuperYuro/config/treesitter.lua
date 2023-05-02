require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"arduino", -- Arduino
		"bash", -- Bash
		"c", -- C
		"c_sharp", -- C#
		"comment", -- Comments like TODO: or FIXME:
		"cpp", -- C++
		"css", -- CSS
		"dockerfile", -- Dockerfile
		"fish", -- Fish
		"gitcommit", -- git commit
		"gitignore", -- .gitignore
		"haskell", -- Haskell
		"html", -- HTML
		"htmldjango", -- Django HTML
		"javascript", -- JavaScript
		"json", -- Json
		"lua", -- Lua
		"make", -- Makefile
		"markdown", -- Markdown, required by lspsaga
		"markdown_inline", -- Markdown, required by lspsaga
		"python", -- Python
		"rust", -- Rust
		"toml", -- TOML
		"tsx", -- TypeScriptReact
		"typescript", -- TypeScript
		"yaml", -- YAML
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	endwise = {
		enable = true,
	},
})
require("nvim-ts-autotag").setup()
