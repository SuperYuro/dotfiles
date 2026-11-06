local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        -- Mappings for insert mode
        ["<C-g>"] = actions.close,
      },
      n = {
        -- Mappings for normal mode
        ["q"] = actions.close,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
    oldfiles = {
      theme = "dropdown",
    },
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = false,
      initial_mode = "normal",
    },
    undo = {},
    emoji = {
      action = function(emoji)
        vim.fn.setreg("*", emoji.value)
        print([[Press p or "*p to paste this emoji]] .. emoji.value)
        vim.api.nvim_put({ emoji.value }, "c", false, true)
      end,
    },
  },
})

for _, extension in ipairs({ "file_browser", "undo", "emoji", "aerial" }) do
  telescope.load_extension(extension)
end

local function map(lhs, rhs, desc) vim.keymap.set("n", lhs, rhs, { desc = desc }) end

map(";f", "<cmd>Telescope find_files<cr>", "Telescope find files")
map(";g", "<cmd>Telescope live_grep<cr>", "Telescope live grep")
map(";b", "<cmd>Telescope buffers<cr>", "Telescope buffers")
map(";c", "<cmd>Telescope command_history<cr>", "Telescope command history")
map(";;", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "Telescope file browser")
map(";u", "<cmd>Telescope undo<cr>", "Telescope history")
map(";e", "<cmd>Telescope emoji<cr>", "Telescope emoji")
map("<leader>ar", "<cmd>Telescope aerial<cr>", "Telescope aerial")
