local keymap = vim.keymap

-- Emacs like keymap in Insert mode
keymap.set('i', '<C-f>', '<right>')
keymap.set('i', '<C-b>', '<left>')
keymap.set('i', '<C-p>', '<up>')
keymap.set('i', '<C-n>', '<down>')

keymap.set('i', '<C-a>', '<home>')
keymap.set('i', '<C-e>', '<end>')

keymap.set('i', '<M-f>', '<C-right>')
keymap.set('i', '<M-b>', '<C-left>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Crush macro shortcut
keymap.set('n', 'q', ':w<CR>')

-- Redo with U
keymap.set('n', 'U', '<C-r>')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Switch tab
keymap.set('n', 'tn', 'gt')
keymap.set('n', 'tp', 'gT')

-- Switch buffer
keymap.set('n', '<Tab>', ':bnext<Return>', { silent = true })
keymap.set('n', '<S-Tab>', ':bprevious<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

-- Switch window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sl', '<C-w>l')

-- Exit terminal insert mode with Esc
keymap.set('t', '<Esc>', '<C-\\><C-n>')
