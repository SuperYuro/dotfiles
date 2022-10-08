local keymap = vim.keymap

-- Emacs like keymap in Insert mode
keymap.set('i', '<C-f>', '<right>')
keymap.set('i', '<C-b>', '<left>')
keymap.set('i', '<C-p>', '<up>')
keymap.set('i', '<C-n>', '<down>')
keymap.set('i', '<C-a>', '<home>')
keymap.set('i', '<C-e>', '<end>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Redo with U
keymap.set('n', 'U', '<C-r>')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return>', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return>', { silent = true })

-- Switch buffer
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sl', '<C-w>l')

-- Exit terminal insert mode with Esc
keymap.set('t', '<Esc>', '<C-\\><C-n>')
