-- Tabline
require("bufferline").setup({
  options = {
    highlights = require("catppuccin.special.bufferline").get_theme(),
    mode = "tabs",
    themable = true,
    numbers = "buffer_id",
    indicator = {
      style = "icon",
    },
    buffer_close_icon = "󰅖",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    diagnostics = "nvim_lsp",
    offsets = {},
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icons = false,
    show_tab_indicators = false,
    show_duplicate_prefix = false,
    separator_style = "slant",
    always_show_bufferline = true,
    sort_by = "tabs",
  },
})

-- Editor decorations
require("ibl").setup({})
require("rainbow-delimiters.setup").setup({})
require("scrollbar").setup({})
require("todo-comments").setup({})

-- Keymap hints (timeout is set in plugin/options.lua)
require("which-key").setup({})
