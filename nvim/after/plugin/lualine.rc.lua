local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'nord',
        -- component_separators = { left = '|', right = '|' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
            'filename',
            file_status = true,
            newfile_status = false,
            path = 1
        } },
        lualine_x = {
            'fileformat',
            'filetype'
        },
        lualine_y = { 'progress', 'location' },
        lualine_z = { {
            'diagnostics',
            sources = { 'nvim_diagnostic', 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint' },
            diagnostics_color = {
                error = 'DiagnosticError',
                warn = 'DiagnosticsWarn',
                info = 'DiagnosticsInfo',
                hint = 'DiagnosticsHint',
            },
            symbols = {
                error = 'E',
                warn = 'W',
                info = 'I',
                hint = 'H',
            }
        }, }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        -- lualine_a = { {
        --     'tabs',
        --     mode = 1,
        --     tabs_color = {
        --         active = 'lualine_a_normal',
        --         inactive = 'lualine_a_inactive',
        --     },
        -- } },
        -- lualine_b = { {
        --     'buffers',
        --     show_filename_only = true,
        --     show_modified_status = true,
        --     mode = 2,
        --     buffers_color = {
        --         -- Same values as the general color option can be used here.
        --         active = 'lualine_b_normal', -- Color for active buffer.
        --         inactive = 'lualine_b_inactive', -- Color for inactive buffer.
        --     },
        --     symbols = {
        --         modified = ' M ', -- Text to show when the buffer is modified
        --         alternate_file = ' # ', -- Text to show to identify the alternate file
        --         directory = ' D ', -- Text to show when the buffer is a directory
        --     }
        -- } }
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
