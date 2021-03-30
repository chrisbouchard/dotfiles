local packer = require 'packer'

return packer.startup(function()
    -- Packer itself
    use 'wbthomason/packer.nvim'

    -- Color scheme (vimscript)
    use {
        'gruvbox-community/gruvbox',
        run = [[:colorscheme gruvbox]],
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
        -- run = function()
        --     require 'config.lexima'
        -- end,
    }

    -- TreeSitter and plugins
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'windwp/nvim-ts-autotag',
        },
        run = function()
            require 'config.treesitter'
            vim.cmd [[TSUpdate]]
        end,
    }

    -- Completion interface
    use {
        'hrsh7th/nvim-compe',
        after = 'lexima.vim',
        run = function()
            require 'config.compe'
        end,
    }

    -- Pre-packaged LSP configurations
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'kosayoda/nvim-lightbulb',
        },
        run = function()
            require 'config.lsp'
        end,
    }

    -- Support snippets for LSP completion
    use {
        'norcalli/snippets.nvim',
        run = function()
            require 'config.snippets'
        end,
    }

    -- Statusline support for LSP
    use {
        'nvim-lua/lsp-status.nvim',
        -- run = function()
        --     require 'config.lsp_status'
        -- end,
    }

    -- Pop-up fuzzy-finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'gbrlsnchs/telescope-lsp-handlers.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        },
        run = function()
            require 'config.telescope'
        end,
    }

    -- Indent guides using virtual text
    use {
        'lukas-reineke/indent-blankline.nvim',
        branch = 'lua',
        -- run = function()
        --     require 'config.indent_blankline'
        -- end,
    }

    -- Show signs for git changes
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        run = function()
            require 'config.gitsigns'
        end,
    }
end)

