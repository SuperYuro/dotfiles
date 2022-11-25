local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
    options = {
        mode = 'tabs',
        separator_style = 'slant',
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        show_close_icon = false,
        color_icons = true,
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
    },
    highlights = require('nord').bufferline.highlights({
        italic = true,
        bold = true,
        fill = '#181c24'
    })
}

vim.api.nvim_set_keymap('n', 'tn', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', 'tp', '<cmd>BufferLineCyclePrev<cr>', {})
