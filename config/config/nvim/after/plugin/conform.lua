local conform = require("conform")

---@param name string
---@param bufnr integer
local function available(name, bufnr) return conform.get_formatter_info(name, bufnr).available end

-- Formatters for web files, chosen per buffer from the project's config files:
-- Prettier if configured, otherwise Biome if configured, plus rustywind for Tailwind CSS projects
---@param bufnr integer
---@return string[]
local function web_formatters(bufnr)
  local formatters = {}
  if available("prettier", bufnr) then
    formatters[#formatters + 1] = "prettier"
  elseif available("biome", bufnr) then
    formatters[#formatters + 1] = "biome"
  end
  if available("rustywind", bufnr) then
    formatters[#formatters + 1] = "rustywind"
  end
  return formatters
end

conform.setup({
  formatters_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },

    lua = { "stylua" },

    html = web_formatters,
    css = web_formatters,
    scss = web_formatters,
    javascript = web_formatters,
    javascriptreact = web_formatters,
    typescript = web_formatters,
    typescriptreact = web_formatters,
    svelte = web_formatters,
    astro = web_formatters,
    vue = web_formatters,

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
  formatters = {
    -- Only use these when the project has a config file for them
    prettier = { require_cwd = true },
    biome = { require_cwd = true },
    rustywind = {
      condition = function(_, ctx)
        local configs = { "tailwind.config.js", "tailwind.config.mjs", "tailwind.config.ts" }
        return vim.fs.root(ctx.dirname, configs) ~= nil
      end,
    },
  },
})
