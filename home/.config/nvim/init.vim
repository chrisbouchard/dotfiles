" ********** PLUGINS **********

" Bootstrap the dein plugin system. This plugin must already be cloned in
" ~/.cache/dein.
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Colors
    call dein#add('twerth/ir_black')

    " Features
    call dein#add('airblade/vim-gitgutter')
    call dein#add('chrisbouchard/evaluate.vim')
    "call dein#add('jeetsukumaran/vim-buffergator')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('kergoth/vim-hilinks')
    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('lukaszb/vim-web-indent')
    call dein#add('michaeljsmith/vim-indent-object')
    call dein#add('plytophogy/vim-virtualenv')
    call dein#add('tmhedberg/matchit')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-eunuch')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('vim-scripts/sudo.vim')
    call dein#add('wellle/targets.vim')
    call dein#add('wesQ3/vim-windowswap')

    " Syntax
    call dein#add('sheerun/vim-polyglot')
    call dein#add('justinmk/vim-syntax-extra')

    " LSP
    call dein#add('autozimu/LanguageClient-neovim', {
        \ 'rev': 'next',
        \ 'build': 'bash install.sh',
        \ })
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/echodoc.vim')

    " FZF
    " This plugin must be installed externally.
    call dein#add('~/.fzf')
    call dein#add('junegunn/fzf.vim')

    call dein#end()
    call dein#save_state()
endif

" Install any missing plugins on startup.
if dein#check_install()
    call dein#install()
endif


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
colorscheme ir_black


" ********** SETTINGS **********

set encoding=utf-8
set updatecount=0
set autoread
set nobackup
set backupcopy=yes
set hidden
set cursorline
set mouse=a

set shortmess=lnrxIc
set noshowmode
set showcmd
set modeline
set laststatus=2
set showtabline=0

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
set cindent
set copyindent

set scrolloff=2
set sidescrolloff=2

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:∘

set completeopt-=preview
set completeopt+=menu,menuone
set signcolumn=yes


" ********** PLUGIN SETTINGS **********

let g:buffergator_autoexpand_on_split = 0
let g:buffergator_display_regime = "basename"
let g:buffergator_show_full_directory_path = 0
let g:buffergator_sort_regime = "filepath"

let g:rustfmt_autosave = 1


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


" ********** AUTOCOMPLETION AND LSP SETTINGS **********
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls']
    \ }

augroup LangaugeClient_config
    autocmd!
    autocmd User LanguageClientStarted nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
    autocmd User LanguageClientStarted nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
    autocmd User LanguageClientStarted nnoremap <buffer> <silent> <A-CR> :call LanguageClient#contextMenu()<CR>
augroup END
