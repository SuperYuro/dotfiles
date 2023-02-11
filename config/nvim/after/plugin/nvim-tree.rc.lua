local status, tree = pcall(require, "nvim-tree")
if not status then
	return
end

tree.setup({})

vim.keymap.set("n", "<C-t>", ":NvimTreeToggle<Return>", { silent = true, noremap = true })
