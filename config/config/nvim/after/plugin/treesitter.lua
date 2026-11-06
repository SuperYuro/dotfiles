require("treesitter-context").setup({})

-- Symbols for <leader>ar (Telescope aerial) and statusline breadcrumbs
require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
})
