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
      automatic_enable = true,
    },
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
      "stevearc/dressing.nvim", -- optional for vim.ui.select
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
}
