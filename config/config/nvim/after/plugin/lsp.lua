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

    "basedpyright",
    "ruff",

    "taplo",
  },
  tools = {
    -- Formatters
    "stylua",
    "clang-format",
    "rustywind",

    -- "jq",
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

require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

require("mason-lspconfig").setup({
  ensure_installed = ensure_installed.lsp,
  automatic_enable = {
    exclude = {
      "vue_ls",
    },
  },
})

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

configure_lsp("gleam", {})

configure_lsp("nixd", {})

configure_lsp("roslyn", {
  settings = {
    ["csharp|inlay_hints"] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
    },
    ["csharp|code_lens"] = {
      dotnet_enable_references_code_lens = true,
    },
  },
})

configure_lsp("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
      disableOrganizeImports = true,
    },
  },
})

require("mason-tool-installer").setup({
  ensure_installed = ensure_installed.tools,
  auto_update = true,
  run_on_start = true,
})

require("conform").setup({
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

    -- json = { "jq" },
    -- jsonc = { "jq" },
    toml = { "taplo" },
    yaml = { "yamlfmt" },

    fish = { "fish_indent" },
    sh = { "beautysh" },
  },
  format_on_save = {
    timeout_ms = 10000,
    lsp_fallback = true,
  },
})

require("lazydev").setup({
  library = {
    -- See the configuration section for more details
    -- Load luvit types when the `vim.uv` word is found
    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
  },
})

require("flutter-tools").setup({
  fvm = true,
  debugger = {
    enabled = true,
  },
})

require("roslyn").setup({})
