" ********** PYTHON 3 **********

" Disable Python 2
let g:loaded_python_provider = 1

" ********** PLUGINS **********

" Bootstrap the dein plugin system. This plugin must already be cloned in
" ~/.cache/dein.
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Colors
    call dein#add('morhetz/gruvbox')

    " Features
    call dein#add('AaronLasseigne/yank-code')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('chrisbouchard/evaluate.vim')
    call dein#add('junegunn/vim-easy-align')
    call dein#add('kergoth/vim-hilinks')
    call dein#add('lambdalisue/suda.vim')
    call dein#add('Lenovsky/nuake')
    call dein#add('lukaszb/vim-web-indent')
    call dein#add('michaeljsmith/vim-indent-object')
    call dein#add('nathanaelkane/vim-indent-guides')
    call dein#add('plytophogy/vim-virtualenv')
    call dein#add('rliang/termedit.nvim')
    call dein#add('tmhedberg/matchit')
    call dein#add('tmsvg/pear-tree')
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-eunuch')
    call dein#add('tpope/vim-fugitive')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-unimpaired')
    call dein#add('vim-scripts/sudo.vim')
    call dein#add('wellle/targets.vim')
    call dein#add('wesQ3/vim-windowswap')

    " Syntax
    call dein#add('lervag/vimtex')
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
    " This plugin must be installed externally. If it is, add it.
    if isdirectory($HOME . "/fzf")
        call dein#add($HOME . '/fzf')
    endif
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
let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1
colorscheme gruvbox


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
set cindent
set copyindent

set scrolloff=2
set sidescrolloff=2

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:∘

set completeopt-=preview
set completeopt+=menu,menuone
set signcolumn=yes

set title


" ********** PLUGIN SETTINGS **********

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

let g:polyglot_disabled = ['latex']
let g:rustfmt_autosave = 1
let g:suda_smart_edit = 1
let g:tex_flavor = 'latex'


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


" ********** AUTOCOMPLETION AND LSP SETTINGS **********
let g:deoplete#enable_at_startup = 1
let g:echodoc#enable_at_startup = 1

let g:LanguageClient_serverCommands = {
            \ 'python': ['/mnt/c/Program Files/Python37/Scripts/pyls.exe'],
            \ 'rust': ['rls']
            \ }

function LanguageClient_config()
    if has_key(g:LanguageClient_serverCommands, &filetype)
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<CR>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
        nnoremap <buffer> <silent> <A-CR> :call LanguageClient#textDocument_codeAction()<CR>
        nnoremap <buffer> <silent> <C-Space> :call LanguageClient_contextMenu()<CR>
        setlocal formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
    endif
endfunction

autocmd FileType * call LanguageClient_config()

