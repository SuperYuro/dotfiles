local M = {}

M.shell = function()
  if vim.fn.has("win32") == 1 then
    return "pwsh"
  else
    return "fish"
  end
end

return M
