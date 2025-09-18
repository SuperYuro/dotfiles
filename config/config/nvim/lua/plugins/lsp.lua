local ensure_installed = {
  lsp = {
    "clangd",

    "rust_analyzer",

    "lua_ls",

    "gopls",

    "dockerls",
    "docker_compose_language_service",

    "html",
    "cssls",
    "ts_ls",
    "vue_ls",
    "svelte",
    "astro",
    "tailwindcss",

    "biome",
    "eslint",

    "ruff",

    "taplo",
  },
  tools = {
    -- Formatters
    "stylua",
    "clang-format",
    "rustywind",

    "black",
    "isort",

    "jq",
    "yamlfmt",

    "biome",

    -- Linters
    "flake8",
    "yamllint",
  },
}

local builtins = require("conform-selector.builtins")
local js_formatters = builtins.javascript.formatters()
local configure_lsp = require("utils.lsp").configure_lsp

return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    event = "LspAttach",
    opts = {
      ensure_installed = ensure_installed.lsp,
      automatic_enable = {
        exclude = {
          "vue_ls",
        },
      },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      local vue_language_server_path = vim.fn.expand("$MASON/packages") .. "/vue-language-server" .. "/node_modules/@vue/language-server"
      local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      local ts_ls_config = {
        init_options = {
          plugins = {
            vue_plugin,
          },
        },
        filetypes = tsserver_filetypes,
      }

      local vue_ls_config = {}

      configure_lsp("vue_ls", vue_ls_config)
      configure_lsp("ts_ls", ts_ls_config)

      configure_lsp("csharp_ls", {})
      configure_lsp("gleam", {})
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = ensure_installed.tools,
      auto_update = true,
      run_on_start = true,
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    cmd = { "Lspsaga" },
    keys = {
      { "<leader>lf", "<cmd>Lspsaga finder<cr>", desc = "Lspsaga finder" },
      { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Lspsaga rename" },
      { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
      { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" },
      { "gD", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
      { "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Goto next diagnostics" },
      { "<leader>e", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Show line diagnostics" },
    },
    opts = function()
      return {
        lightbulb = {
          enable = false,
        },
        finder = {
          layout = "float",
          silent = false,
          keys = {
            toggle_or_open = { "o", "<space>" },
            vsplit = { "<C-v>" },
            tabnew = { "<C-t>" },
            quit = { "q", "<ESC>" },
          },
        },
        rename = {
          in_select = true,
          auto_save = true,
          keys = {
            exec = { "<CR>" },
            quit = { "<ESC>" },
          },
        },
        hover_doc = {
          -- open_cmd = browser(),
        },
        code_action = {
          num_shortcut = true,
          show_server_name = true,
          extend_gitsigns = false,
          keys = {
            quit = { "q", "<ESC>" },
            exec = { "<CR>" },
          },
        },
        symbol_in_winbar = {
          separator = "  ",
          enable = true,
          show_file = true,
        },
        diagnostics = {
          show_code_action = true,
          keys = {
            quit = { "q", "<ESC>" },
          },
        },
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "VeryLazy",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },

        lua = { "stylua" },

        html = js_formatters,
        css = js_formatters,
        scss = js_formatters,
        javascript = js_formatters,
        javascriptreact = js_formatters,
        typescript = js_formatters,
        typescriptreact = js_formatters,
        svelte = js_formatters,
        astro = js_formatters,
        vue = js_formatters,

        json = { "jq" },
        jsonc = { "jq" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },

        fish = { "fish_indent" },
        sh = { "beautysh" },
      },
      format_on_save = {
        timeout_ms = 10000,
        lsp_fallback = true,
      },
    },
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      fvm = true,
      debugger = {
        enabled = true,
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "Decodetalkers/csharpls-extended-lsp.nvim",
  },
}
