require("treesitter-context").setup({})

-- Symbols for <leader>ar (Telescope aerial) and statusline breadcrumbs
require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
})

-- nvim-treesitter (main branch) does not enable highlighting by itself:
-- start it for every filetype that has a parser and highlight queries.
-- vim.treesitter.start() turns off regex syntax even without queries,
-- so check them first to keep the regex highlighting as a fallback.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang or not vim.treesitter.language.add(lang) then
      return
    end
    local ok, query = pcall(vim.treesitter.query.get, lang, "highlights")
    if ok and query then
      vim.treesitter.start(ev.buf, lang)
    end
  end,
})
