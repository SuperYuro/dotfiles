local status, moonfly = pcall(require, "moonfly")
if not status then
	return
end

vim.g.moonflyCursorColor = true
vim.g.moonflyTransparent = true
vim.g.moonflyMatchParen = true
vim.cmd([[colorscheme moonfly]])
