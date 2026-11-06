require("nvim-autopairs").setup({})

require("nvim-ts-autotag").setup({
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
})

require("hop").setup({})
vim.keymap.set({ "n", "v" }, "<C-Space>", "<cmd>HopWord<cr>", { desc = "Hop word" })
