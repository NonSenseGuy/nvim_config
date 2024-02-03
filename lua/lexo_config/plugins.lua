-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        'folke/trouble.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons',
        },
    }

    use 'lukas-reineke/indent-blankline.nvim'
    use 'numToStr/Comment.nvim'

    -- use "ellisonleao/gruvbox.nvim"
    -- use "rebelot/kanagawa.nvim"
    use "themercorp/themer.lua"

    use 'xiyaowong/transparent.nvim'

    use 'kyazdani42/nvim-tree.lua'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'linrongbin16/lsp-progress.nvim',
            'nvim-tree/nvim-web-devicons',
            opt = true,
        }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'saadparwaiz1/cmp_luasnip' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' },

            { 'folke/neodev.nvim' },
            { 'onsails/lspkind-nvim' },
        }
    }

    use {
        'ray-x/go.nvim',
        requires = {
            'ray-x/guihua.lua'
        }
    }

    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'kylechui/nvim-surround'
    use 'petobens/poet-v'

    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
end)