-- Packer is an optional plugin, so make sure it's loaded.
vim.cmd [[packadd 'packer.nvim']]

local packer = require 'packer'

return packer.startup(function()
    -- Color scheme (vimscript)
    use {
        -- TODO: Switch back to gruvbox-community/gruvbox when they add
        -- treesitter support.
        'npxbr/gruvbox.nvim',
        requires = {
            "rktjmp/lush.nvim"
        },
        config = function ()
            vim.cmd [[:colorscheme gruvbox]]
        end,
    }

    -- TODO: Organize? Dependencies? Configuration?
    use 'AaronLasseigne/yank-code'
    use 'chrisbouchard/evaluate.vim'
    use 'junegunn/vim-easy-align'
    use 'kergoth/vim-hilinks'
    use 'lambdalisue/suda.vim'
    use 'Lenovsky/nuake'
    use 'nixon/vim-vmath'
    use 'plytophogy/vim-virtualenv'
    use 'rliang/termedit.nvim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'vim-airline/vim-airline'
    use 'wellle/targets.vim'
    use 'wesQ3/vim-windowswap'

    -- Auto-pairs
    use {
        'cohama/lexima.vim',
        config = function()
            require 'config.lexima'
        end,
    }

    -- TreeSitter and plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'windwp/nvim-ts-autotag',
        },
        run = [[:TSUpdate]],
        config = function()
            require 'config.treesitter'
        end,
    }

    -- Completion interface
    use {
        'hrsh7th/nvim-compe',
        -- Compe must be configured after Lexima, because the order of the
        -- mappings matters.
        after = 'lexima.vim',
        config = function()
            require 'config.compe'
        end,
    }

    -- Pre-packaged LSP configurations
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('config.lsp').setup()
        end,
    }

    -- Support snippets for LSP completion
    use {
        'norcalli/snippets.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('config.snippets').setup()
        end,
    }

    -- Statusline support for LSP
    use {
        'nvim-lua/lsp-status.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('config.lsp-status').setup()
        end,
    }

    -- Show lightbulb icon when LSP actions are available
    use {
        'kosayoda/nvim-lightbulb',
        after = 'nvim-lspconfig',
        config = function()
            require('config.lightbulb').setup()
        end,
    }

    -- Rust-specific LSP configuration
    use {
        'simrat39/rust-tools.nvim',
        after = 'nvim-lspconfig',
        config = function()
            require('config.rust-tools').setup()
        end,
    }


    -- Pop-up fuzzy-finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'gbrlsnchs/telescope-lsp-handlers.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        config = function()
            require 'config.telescope'
        end,
    }

    -- Indent guides using virtual text
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        -- config = function()
        --     require 'config.indent_blankline'
        -- end,
    }

    -- Show signs for git changes
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require 'config.gitsigns'
        end,
    }
end)

