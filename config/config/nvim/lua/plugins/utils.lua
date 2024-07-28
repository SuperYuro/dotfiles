return {
  {
    "jghauser/mkdir.nvim",
    lazy = false,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },
}
