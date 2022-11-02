local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
    options = {
        mode = 'tabs',
        separator_style = 'thin',
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
    },
    highlights = {
        -- separator = {
        --     fg = '#073642',
        --     bg = '#002b36'
        -- },
        -- separator_selected = {
        --     fg = '#073642'
        -- },
        -- background = {
        --     fg = '#657b83',
        --     bg = '#002b36'
        -- },
        -- buffer_selected = {
        --     fg = '#fdf6e3',
        -- },
        -- fill = {
        --     bg = '#073642',
        --     -- underline = true,
        --     -- undercurl = true,
        --     -- italic = true,
        --     -- bold = true
        -- }
    }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<cr>', {})
vim.api.nvim_set_keymap('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<cr>', {})
