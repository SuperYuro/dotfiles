local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    -- Colorscheme
    use({
        "shaunsingh/nord.nvim",
        config = function()
            vim.cmd([[colorscheme nord]])
        end,
    })

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("SuperYuro.config.telescope")
        end,
    })

    -- Tab bar
    use({
        "akinsho/bufferline.nvim",
        tag = "*",
        requires = {
            { "nvim-tree/nvim-web-devicons" },
        },
        config = function()
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    separator_style = "slant",
                    always_show_bufferline = true,
                },
            })
            vim.api.nvim_set_keymap("n", "tn", "<cmd>BufferLineCycleNext<cr>", {})
            vim.api.nvim_set_keymap("n", "tp", "<cmd>BufferLineCyclePrev<cr>", {})
        end,
    })

    -- Syntax Highlighting
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("SuperYuro.config.treesitter")
        end,
    })

    -- LSP
    use({
        "neovim/nvim-lspconfig",
        requires = {
            {
                "williamboman/mason.nvim",
                run = ":MasonUpdate",
            },
            {
                "williamboman/mason-lspconfig.nvim",
            },
        },
        config = function()
            require("SuperYuro.config.nvim-lspconfig")
        end,
    })

    -- LSP UI
    use({
        "glepnir/lspsaga.nvim",
        opt = true,
        branch = "main",
        event = "LspAttach",
        config = function()
            require("SuperYuro.config.lspsaga")
        end,
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        confg = function()
            require("gitsigns").setup()
        end,
    })

    -- Format and Lint
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("SuperYuro.config.null-ls")
        end,
    })

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        requires = {
            -- { "onsails/lspkind.nvim" }, -- Icons
            -- { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
            -- require("SuperYuro.config.completions")
        end,
    })

    -- Create missing directories when saving files
    use({
        "jghauser/mkdir.nvim",
    })

    -- Autopair
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({
                disable_filetype = { "TelescopePrompt", "vim" },
            })
        end,
    })

    -- Autotag

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
