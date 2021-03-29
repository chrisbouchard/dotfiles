" ********** PYTHON 3 **********

" Disable Python 2
let g:loaded_python_provider = 1

" ********** PLUGIN SETTINGS **********

let g:airline_powerline_fonts = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_italic = 1
let g:indent_blankline_char = '│'
let g:rustfmt_autosave = 1  " TODO: Is this being used?
let g:suda_smart_edit = 1


" ********** PLUGINS **********

call plug#begin(stdpath('data') . '/plugged')

" Colors
Plug 'gruvbox-community/gruvbox'

" Features
Plug 'AaronLasseigne/yank-code'
Plug 'chrisbouchard/evaluate.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kergoth/vim-hilinks'
Plug 'lambdalisue/suda.vim'
Plug 'Lenovsky/nuake'
Plug 'nixon/vim-vmath'
Plug 'plytophogy/vim-virtualenv'
Plug 'rliang/termedit.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'wellle/targets.vim'
Plug 'wesQ3/vim-windowswap'

" Completion-related
" TODO: Organize plugins.
Plug 'cohama/lexima.vim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'windwp/nvim-ts-autotag'

Plug 'hrsh7th/nvim-compe'
Plug 'neovim/nvim-lspconfig'
Plug 'norcalli/snippets.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Statusline support for LSP
Plug 'nvim-lua/lsp-status.nvim'

" Light-bulb indicator for LSP code actions
Plug 'kosayoda/nvim-lightbulb'

" Telescope (fuzzy picker) and extensions
Plug 'nvim-telescope/telescope.nvim'
Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'

" Indentation lines
" TODO: Switch back to master once Neovim 0.5 is released
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}

" Lua-based git marks
" Also requires nvim-lua/plenary.nvim
Plug 'lewis6991/gitsigns.nvim'

call plug#end()


" ********** COLORSCHEME **********

if has("termguicolors")
    set termguicolors
endif

set background=dark
colorscheme gruvbox


" ********** SETTINGS **********

set hidden
set cursorline
set mouse=a
set updatetime=300

set cmdheight=2
set shortmess=flnrxIc
set noshowmode
set showtabline=0
set wildmode=list:longest

set number
set noerrorbells

set nofoldenable
set nowrap
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab
set autoindent
set smartindent

set scrolloff=2
set sidescrolloff=2

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:∘

set completeopt=menuone,noselect
set signcolumn=yes

set title


lua require('compe_config')
lua require('gitsigns_config')
lua require('lsp_config')
lua require('snippets_config')
lua require('telescope_config')
lua require('treesitter_config')


" ********** MAPPINGS **********

let mapleader=","

inoremap jj <Esc>
inoremap kk <Esc>

nnoremap ' `
nnoremap ` '

noremap  <silent> <F1> <nop>
noremap! <silent> <F1> <nop>

map <leader>y <plug>YankCode

nnoremap <F4> <cmd>Nuake<CR>
inoremap <F4> <cmd>Nuake<CR>
tnoremap <F4> <cmd>Nuake<CR>

vnoremap <expr> ++ VMATH_YankAndAnalyse()
    nmap        ++ vip++


" NOTE: Order is important. You can't lazy loading lexima.vim.
" This note is from the Compe readme, but I'm not quite sure what it means.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" Find files using Telescope command-line sugar.
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>fp <cmd>Telescope git_files<cr>

