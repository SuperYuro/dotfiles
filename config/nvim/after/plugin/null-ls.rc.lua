local status, nullls = pcall(require, "null-ls")
if not status then
	return
end

nullls.setup({
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_command([[augroup Format]])
			vim.api.nvim_command([[autocmd! * <buffer>]])
			-- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
			vim.api.nvim_command([[augroup END]])
		end
	end,
	sources = {
		-- For Shell Script
		nullls.builtins.formatting.beautysh,
		-- For Ruby
		nullls.builtins.formatting.rubocop,
		-- For Python
		nullls.builtins.formatting.autopep8,
		nullls.builtins.formatting.isort,
		-- For C/C++
		nullls.builtins.formatting.clang_format,
		-- For Rust
		nullls.builtins.formatting.rustfmt,
		-- For Lua
		nullls.builtins.formatting.stylua,
		-- For CSS, JavaScript
		nullls.builtins.formatting.prettier,
		-- For C#
		nullls.builtins.formatting.csharpier,
	},
})
