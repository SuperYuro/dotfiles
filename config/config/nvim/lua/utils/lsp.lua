local M = {}

---Configure LSP
---@param name string
---@param config vim.lsp.Config
M.configure_lsp = function(name, config)
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

return M
