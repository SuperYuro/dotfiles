-- Set mode to Insert when open built-in terminal
vim.api.nvim_create_autocmd("TermOpen", { pattern = "*", command = "startinsert" })

-- LSP keymaps (only in buffers with an attached language server)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { buffer = ev.buf, desc = desc }) end

    map("K", vim.lsp.buf.hover, "Hover doc")
    map("<leader>lf", function() require("telescope.builtin").lsp_references() end, "References")
    map("<leader>rn", vim.lsp.buf.rename, "Rename")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("gd", vim.lsp.buf.definition, "Goto definition")
    map("gD", vim.lsp.buf.type_definition, "Goto type definition")
    map("<C-j>", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Goto next diagnostics")
    map("<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
  end,
})

-- Create missing parent directories when saving a file
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(ev)
    -- Skip non-local paths such as scp:// or oil://
    if ev.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(ev.match) or ev.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Highlight other references of the word under the cursor
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client:supports_method("textDocument/documentHighlight", ev.buf) then
      return
    end

    local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. ev.buf, { clear = true })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = group,
      buffer = ev.buf,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufLeave" }, {
      group = group,
      buffer = ev.buf,
      callback = vim.lsp.buf.clear_references,
    })
  end,
})
