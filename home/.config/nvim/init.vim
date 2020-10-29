" ********** PYTHON 3 **********

" Disable Python 2
let g:loaded_python_provider = 1

" ********** PLUGIN SETTINGS **********

let g:airline_powerline_fonts = 1

" Visualize diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '40'
" Don't show diagnostics while in insert mode
let g:diagnostic_insert_delay = 1

let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

let g:polyglot_disabled = ['latex']
let g:rustfmt_autosave = 1
let g:suda_smart_edit = 1
let g:tex_flavor = 'latex'


" ********** PLUGINS **********

call plug#begin(stdpath('data') . '/plugged')

" Colors
Plug 'morhetz/gruvbox'

" Features
Plug 'AaronLasseigne/yank-code'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbouchard/evaluate.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kergoth/vim-hilinks'
Plug 'lambdalisue/suda.vim'
Plug 'Lenovsky/nuake'
Plug 'lukaszb/vim-web-indent'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'nixon/vim-vmath'
Plug 'plytophogy/vim-virtualenv'
Plug 'rliang/termedit.nvim'
Plug 'tmhedberg/matchit'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/sudo.vim'
Plug 'wellle/targets.vim'
Plug 'wesQ3/vim-windowswap'

" Syntax
Plug 'lervag/vimtex', { 'for': ['latex', 'tex'] }
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" FZF
" This plugin will be installed externally. If it is, add it.
if isdirectory($HOME . '/.fzf')
    Plug $HOME . '/.fzf'
endif
Plug 'junegunn/fzf.vim'

call plug#end()


" " ********** POWERLINE **********
" 
" if has('python3')
"     python3 from powerline.vim import setup as powerline_setup
"     python3 powerline_setup()
"     python3 del powerline_setup
" endif


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

set completeopt=menuone,noinsert,noselect
set signcolumn=yes

set title


" ********** MAPPINGS **********

let mapleader=","

inoremap jj <Esc>
inoremap kk <Esc>

nnoremap ' `
nnoremap ` '

map <silent> <F1> <nop>
map! <silent> <F1> <nop>

nmap <leader>b :Buffers<CR>
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>
nmap <leader>h :History<CR>
nmap <leader>H :Helptags!<CR>
nmap <leader>: :History:<CR>
nmap <leader>/ :History/<CR>

map <leader>y <plug>YankCode

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++


" ********** AUTOCOMPLETION AND LSP SETTINGS **********
lua require 'lsp_config'

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
            \ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment" }


nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"TODO: Needs work
"nnoremap <silent> <F5>  <cmd>lua vim.lsp.buf_request(0, 'textDocument/build', {textDocument = vim.lsp.util.make_text_document_params()})<CR>

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>PrevDiagnosticCycle<cr>
nnoremap <silent> g] <cmd>NextDiagnosticCycle<cr>

