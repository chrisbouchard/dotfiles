" ********** PYTHON 3 **********

" Disable Python 2
let g:loaded_python_provider = 1

" ********** PLUGIN SETTINGS **********

let g:airline_powerline_fonts = 1
let g:indent_blankline_char = '│'
let g:rustfmt_autosave = 1  " TODO: Is this being used?
let g:suda_smart_edit = 1


" ********** COLORSCHEME **********

if has("termguicolors")
    set termguicolors
endif

set background=dark


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
nmap            ++ vip++


" ********** LSP **********

" The LSP server defintions are already set up. We just need to add them to
" the lspconfig table.
lua require 'lsp'


" ********** COMMANDS **********

" Command to load the Packer plugin spec and sync (clean and update) it. This
" will also recompile the plugin auto-loading script.
function PluginSync()
    lua package.loaded['plugins'] = nil
    lua require('plugins').sync()
endfunction

command PluginSync :call PluginSync()

