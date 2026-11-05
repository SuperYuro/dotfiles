return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "svelte",
      "astro",
      "vue",
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
  {
    "monaqa/dial.nvim",
    keys = {
      { "+", function() require("dial.map").manipulate("increment", "normal") end, mode = { "n" } },
      { "-", function() require("dial.map").manipulate("decrement", "normal") end, mode = { "n" } },
      { "+", function() require("dial.map").manipulate("increment", "visual") end, mode = { "v" } },
      { "-", function() require("dial.map").manipulate("decrement", "visual") end, mode = { "v" } },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        },
      })
    end,
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
