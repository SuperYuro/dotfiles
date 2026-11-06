require("gitsigns").setup({})

require("neogit").setup({})
vim.keymap.set("n", "<leader>ng", "<cmd>Neogit kind=tab<cr>", { desc = "Launch neogit" })

require("git-conflict").setup({})
