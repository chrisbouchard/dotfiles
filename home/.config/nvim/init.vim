" ********** PYTHON 3 **********

" Disable Python 2
let g:loaded_python_provider = 1

" ********** PLUGIN SETTINGS **********

let g:airline_powerline_fonts = 1

let g:gruvbox_italic=1
let g:gruvbox_improved_warnings=1

"let g:pear_tree_smart_openers = 1
"let g:pear_tree_smart_closers = 1
"let g:pear_tree_smart_backspace = 1

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
Plug 'kevinoid/vim-jsonc'
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
Plug 'wellle/targets.vim'
Plug 'wesQ3/vim-windowswap'

" Syntax
Plug 'lervag/vimtex', { 'for': ['latex', 'tex'] }
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'

" Completion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" FZF
" This plugin will be installed externally. If it is, add it.
if isdirectory($HOME . '/.fzf')
    Plug $HOME . '/.fzf'
endif

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

set completeopt=menuone,noinsert,noselect
set signcolumn=yes

set title


" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Prettier` command to format current buffer with Prettier specifically.
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" ********** MAPPINGS **********

let mapleader=","

inoremap jj <Esc>
inoremap kk <Esc>

nnoremap ' `
nnoremap ` '

map <silent> <F1> <nop>
map! <silent> <F1> <nop>

map <leader>y <plug>YankCode

nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++


" ********** COC MAPPINGS **********
nnoremap [coc] <Nop>
xnoremap [coc] <Nop>

nmap <Leader>c [coc]
xmap <Leader>c [coc]

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap [coc]rn <Plug>(coc-rename)

" Formatting selected code.
xmap [coc]f  <Plug>(coc-format-selected)
nmap [coc]f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `[coc]aap` for current paragraph
xmap [coc]a  <Plug>(coc-codeaction-selected)
nmap [coc]a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap [coc]ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap [coc]qf  <Plug>(coc-fix-current)

nmap [coc][ <Plug>(coc-diagnostic-prev)
nmap [coc]] <Plug>(coc-diagnostic-next)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)


" ********** COC-FZF-PREVIEW MAPPINGS **********
nnoremap [fzf-p] <Nop>
xnoremap [fzf-p] <Nop>

nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

