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
    highlights = {
        separator = {
            fg = '#3b4252', -- normal black
            bg = '#2e3440' -- background
        },
        separator_selected = {
            fg = '#3b4252' -- normal black
        },
        background = {
            fg = '#4c566a', -- light theme foreground
            bg = '#2e3440' -- background
        },
        buffer_selected = {
            fg = '#e5e9f0', -- light theme background
        },
        fill = {
            bg = '#3b4252', -- normal black
            underline = true,
            undercurl = true,
            italic = true,
            bold = true
        }
    }
}

vim.api.nvim_set_keymap('n', 'tn', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', 'tp', '<cmd>BufferLineCyclePrev<cr>', {})
