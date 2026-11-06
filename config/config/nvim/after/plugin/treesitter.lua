require("treesitter-context").setup({})

-- Symbols for <leader>ar (Telescope aerial) and statusline breadcrumbs
require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
})

-- nvim-treesitter (main branch) does not enable highlighting by itself:
-- start it for every filetype that has an installed parser
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(ev) pcall(vim.treesitter.start, ev.buf) end,
})
