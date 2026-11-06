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

-- Messages, cmdline and notifications
require("notify").setup({
  timeout = 1000,
})

require("noice").setup({
  lsp = {
    progress = {
      enabled = false,
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

-- Editor decorations
require("ibl").setup({})
require("rainbow-delimiters.setup").setup({})
require("scrollbar").setup({})
require("todo-comments").setup({})

-- Keymap hints (timeout is set in SuperYuro.base)
require("which-key").setup({})
