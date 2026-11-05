-- Set mode to Insert when open built-in terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "startinsert" })

-- LSP keymaps (only in buffers with an attached language server)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc }) end

    map("K", vim.lsp.buf.hover, "Hover doc")
    map("<leader>lf", vim.lsp.buf.references, "References")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gD", vim.lsp.buf.type_definition, "Goto type definition")
    map("<C-j>", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Goto next diagnostics")
    map("<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
  end,
})
