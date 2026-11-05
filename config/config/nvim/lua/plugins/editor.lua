return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = true,
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    keys = {
      { "<C-Space>", "<cmd>HopWord<cr>", desc = "Hop word", mode = { "n", "v" } },
    },
    opts = {},
  },
}
