local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed!")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(
    function(use)
        use {
            'wbthomason/packer.nvim',
            run = ':PackerUpdate'
        }
        -- use {
        --     'svrana/neosolarized.nvim',
        --     requires = { 'tjdevries/colorbuddy.nvim' }
        -- }
        -- use 'arcticicestudio/nord-vim' -- Nord colorscheme
        use 'kyazdani42/nvim-web-devicons' -- File icons
        use 'glepnir/lspsaga.nvim' -- LSP UIs
        use 'nvim-lualine/lualine.nvim' -- Statusline
        use 'L3MON4D3/LuaSnip' -- Snippet
        use 'onsails/lspkind-nvim' -- Pictograms
        use 'hrsh7th/cmp-buffer' -- Completion source for buffer words
        use 'hrsh7th/cmp-nvim-lsp' -- Completion source for built-in LSP
        use 'hrsh7th/nvim-cmp' -- Completion
        use 'neovim/nvim-lspconfig' -- LSP
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
        }
        use 'windwp/nvim-autopairs'
        use 'windwp/nvim-ts-autotag'
        use 'tpope/vim-commentary'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope.nvim'
        use 'nvim-telescope/telescope-file-browser.nvim'
        -- use 'akinsho/nvim-bufferline.lua'
        use 'norcalli/nvim-colorizer.lua'
        use 'tpope/vim-fugitive'
    end
)
