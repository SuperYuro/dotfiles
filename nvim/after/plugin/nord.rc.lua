local status, nord = pcall(require, 'nord')
if (not status) then return end

-- Example config in lua
vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = true
vim.g.nord_italic = true
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

-- Load the colorscheme
nord.set()
