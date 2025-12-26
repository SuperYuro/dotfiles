local icons = require("utils.icons")

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
      float = {
        solid = true,
      },
      styles = {
        comments = { "italic" },
        conditionals = {},
        loops = {},
        functions = { "bold", "italic" },
        keywords = { "bold" },
        strings = {},
        variables = { "italic" },
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      lsp_styles = {
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      auto_integrations = true,
    },
    init = function() vim.cmd("colorscheme catppuccin") end,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "UIEnter",
    opts = function()
      return {
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
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = {
          enabled = false,
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = false,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "rainbow-delimiters.setup",
    opts = {},
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    opts = { "*" },
  },
  {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "kevinhwang91/nvim-hlslens",
    },
    config = function()
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.search").setup()
      require("scrollbar").setup()
    end,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    opts = {
      hide = {
        cursorline = false,
        focused_win = false,
        only_win = false,
      },
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
        overlap = {
          winbar = true,
        },
      },
      render = function(props)
        local devicons = require("nvim-web-devicons")
        local palette = require("catppuccin.palettes").get_palette("frappe")

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end
        local ft_icon, _ = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        local bg = props.focused and palette.blue or palette.base
        local fg = props.focused and palette.base or palette.subtext0

        return {
          { " ", ft_icon, " ", filename, " ", guifg = fg, guibg = bg, gui = modified and "bold,italic" or "bold" },
        }
      end,
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    "RRethy/vim-illuminate",
    event = "BufRead",
    opts = {
      providers = {
        "lsp",
        "treesitter",
      },
    },
    config = function(_, opts) require("illuminate").configure(opts) end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    opts = {},
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.1",
    event = "VeryLazy",
    opts = function()
      local palette = require("catppuccin.palettes").get_palette("frappe")

      return {
        colors = {
          copy = palette.yellow,
          delete = palette.red,
          format = palette.peach,
          insert = palette.green,
          replace = palette.teal,
          visual = palette.mauve,
        },
      }
    end,
  },
}
