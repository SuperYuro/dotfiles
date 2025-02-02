-- Customize how diagnostics are displayed
vim.diagnostic.config({
  virtual_text = {
    prefix = require("utils.icons").prelude.bell,
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
