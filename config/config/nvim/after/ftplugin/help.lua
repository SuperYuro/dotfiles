-- Close with q (q is mapped to :w globally); fall back to deleting the buffer
-- when this is the last window
vim.keymap.set("n", "q", function()
  if not pcall(vim.cmd.close) then
    vim.cmd.bdelete()
  end
end, { buffer = true, silent = true, desc = "Close window" })

vim.b.undo_ftplugin = (vim.b.undo_ftplugin and vim.b.undo_ftplugin .. " | " or "") .. "silent! nunmap <buffer> q"
