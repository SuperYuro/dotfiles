local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		vim.api.nvim_command([[augroup END]])
	end
end

local on_attach_sync = function(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
		vim.api.nvim_command([[augroup END]])
	end
end

lspconfig.setup_handlers({
	function(server_name)
		nvim_lsp[server_name].setup({
			on_attach = on_attach,
			-- on_attach = on_attach_sync,
		})
	end,
})

nvim_lsp["clangd"].setup({
	on_attach = on_attach_sync,
})
nvim_lsp["rust_analyzer"].setup({
	on_attach = on_attach_sync,
})
-- nvim_lsp['sumneko_lua'].setup {
--     on_attach = on_attach_sync
-- }
