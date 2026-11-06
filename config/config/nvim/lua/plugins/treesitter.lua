return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "stevearc/aerial.nvim",
    -- Loaded on file open to provide breadcrumbs for the statusline
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      {
        "<leader>ar",
        function()
          require("telescope").load_extension("aerial")
          vim.cmd("Telescope aerial")
        end,
        desc = "Telescope aerial",
      },
    },
    opts = {
      backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    },
  },
}
