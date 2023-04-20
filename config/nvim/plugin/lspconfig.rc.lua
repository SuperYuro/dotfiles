local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if not status2 then
	return
end

local protocol = require("vim.lsp.protocol")

if vim.fn.has("win32") == 1 then
	LAD_PATH_RAW = os.getenv("LOCALAPPDATA")
	LAD_PATH = string.gsub(LAD_PATH_RAW, "\\", "/")
	PSES_BUNDLE_PATH = LAD_PATH .. "/nvim-data/mason/packages/powershell-editor-services"
end

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
		if server_name == "powershell_es" then
			nvim_lsp.powershell_es.setup({
				bundle_path = PSES_BUNDLE_PATH,
			})
		else
			nvim_lsp[server_name].setup({
				-- on_attach = on_attach,
			})
		end
	end,
})
