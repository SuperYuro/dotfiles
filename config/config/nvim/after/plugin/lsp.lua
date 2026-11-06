-- Language servers, their tools and how diagnostics are shown
-- (LSP keymaps and reference highlighting are in plugin/autocmds.lua)

---------------------------------------------------------------------------
-- Diagnostics
---------------------------------------------------------------------------

vim.diagnostic.config({
  virtual_text = {
    prefix = " ", -- nf-oct-bell
    source = true,
  },
  float = {
    source = true,
  },
  signs = false,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

---------------------------------------------------------------------------
-- Install language servers and tools with mason
---------------------------------------------------------------------------

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

require("mason").setup({
  registries = {
    "github:mason-org/mason-registry",
    "github:Crashdummyy/mason-registry",
  },
})

-- Enables every installed server except the ones configured manually below
require("mason-lspconfig").setup({
  ensure_installed = ensure_installed.lsp,
  automatic_enable = {
    exclude = {
      "vue_ls",
    },
  },
})

require("mason-tool-installer").setup({
  ensure_installed = ensure_installed.tools,
  auto_update = true,
  run_on_start = true,
})

---------------------------------------------------------------------------
-- Server settings
---------------------------------------------------------------------------

---Configure and enable a language server
---@param name string
---@param config vim.lsp.Config
local function configure_lsp(name, config)
  vim.lsp.config(name, config)
  vim.lsp.enable(name)
end

-- TypeScript with Vue support (vue_ls needs ts_ls to load the Vue plugin)
local vue_language_server_path = vim.fn.expand("$MASON/packages") .. "/vue-language-server" .. "/node_modules/@vue/language-server"

configure_lsp("vue_ls", {})
configure_lsp("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
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

-- Not installed with mason
configure_lsp("gleam", {})
configure_lsp("nixd", {})

---------------------------------------------------------------------------
-- Language-specific plugins
---------------------------------------------------------------------------

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
