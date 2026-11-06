vim.loader.enable()

-- Plugins are installed and loaded with vim.pack (all of them at startup).
-- Options and keymaps live in plugin/, plugin setup in after/plugin/:
-- Neovim sources this file, then plugin/, then each plugin, then after/plugin/.

local function gh(repo) return "https://github.com/" .. repo end

-- Build steps after install/update (must be registered before vim.pack.add)
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    elseif name == "mason.nvim" then
      if not ev.data.active then
        vim.cmd.packadd("mason.nvim")
      end
      pcall(vim.cmd, "MasonUpdate")
    end
  end,
})

vim.pack.add({
  -- Libraries
  gh("nvim-lua/plenary.nvim"),
  gh("MunifTanjim/nui.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
  gh("nvim-neotest/nvim-nio"),

  -- UI
  { src = gh("catppuccin/nvim"), name = "catppuccin" },
  { src = gh("akinsho/bufferline.nvim"), version = vim.version.range("*") },
  gh("rcarriga/nvim-notify"),
  gh("folke/noice.nvim"),
  gh("lukas-reineke/indent-blankline.nvim"),
  gh("HiPhish/rainbow-delimiters.nvim"),
  gh("kevinhwang91/nvim-hlslens"),
  gh("petertriho/nvim-scrollbar"),
  gh("folke/todo-comments.nvim"),
  gh("folke/which-key.nvim"),
  gh("b0o/incline.nvim"),

  -- Completion
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1") },

  -- Editing
  gh("windwp/nvim-autopairs"),
  gh("windwp/nvim-ts-autotag"),
  { src = gh("smoka7/hop.nvim"), version = vim.version.range("*") },

  -- Git
  gh("lewis6991/gitsigns.nvim"),
  gh("sindrets/diffview.nvim"),
  gh("NeogitOrg/neogit"),
  { src = gh("akinsho/git-conflict.nvim"), version = vim.version.range("*") },

  -- LSP, formatter
  gh("neovim/nvim-lspconfig"),
  gh("mason-org/mason.nvim"),
  gh("mason-org/mason-lspconfig.nvim"),
  gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
  gh("stevearc/conform.nvim"),
  gh("folke/lazydev.nvim"),
  gh("akinsho/flutter-tools.nvim"),
  gh("seblyng/roslyn.nvim"),

  -- Treesitter
  { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },
  gh("nvim-treesitter/nvim-treesitter-context"),
  gh("stevearc/aerial.nvim"),

  -- Telescope
  { src = gh("nvim-telescope/telescope.nvim"), version = "v0.2.0" },
  gh("nvim-telescope/telescope-file-browser.nvim"),
  gh("debugloop/telescope-undo.nvim"),
  gh("xiyaowong/telescope-emoji.nvim"),

  -- Test
  gh("nvim-neotest/neotest"),
  gh("fredrikaverpil/neotest-golang"),
  gh("Issafalcon/neotest-dotnet"),
})
