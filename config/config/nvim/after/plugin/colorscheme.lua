require("catppuccin").setup({
  flavour = "latte",
  float = {
    transparent = false,
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
})

vim.cmd("colorscheme catppuccin-nvim")
