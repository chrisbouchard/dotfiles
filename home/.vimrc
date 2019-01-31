" ********** POWERLINE **********

if has('python3')
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
endif

" ********** FILE TYPES **********

filetype plugin indent on

au BufNewFile,BufRead *.as    setf actionscript
au BufNewFile,BufRead *.h     setf c
au BufNewFile,BufRead *.mal   setf mips
au BufNewFile,BufRead *.maude setf maude
au BufNewFile,BufRead *.mxml  setf mxml
au BufNewFile,BufRead *.mysql setf mysql
au BufNewFile,BufRead *.nice  setf nice
au BufNewFile,BufRead *.psql  setf psql
au BufNewFile,BufRead *.rabl  setf ruby

au FileType make setlocal noexpandtab
au FileType ruby setlocal sw=2
au FileType text setlocal nocindent nosmartindent


" ********** PLUGIN SETTINGS **********

let $PAGER = ''

let mapleader = ","
let vimpager_use_gvim = 1

let g:buffergator_suppress_keymaps = 1
let g:buffergator_autoexpand_on_split = 0
let g:buffergator_sort_regime = "filepath"
let g:buffergator_display_regime = "basename"
let g:buffergator_show_full_directory_path = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ********** RANDOM VIM SETTINGS **********

set exrc
set secure

set nocompatible
set encoding=utf-8
set updatecount=0
set autoread

if &term =~ "screen.*" && len($TMUX) > 0
    set t_ts=]2;
    set t_fs=\\
endif

set title
set titleold=""
set titlestring=VIM:\ %F

set background=dark

set autochdir
set nobackup
set backupcopy=yes
set hidden
set cursorline
set ttymouse=xterm2
set mouse=a

if has("win32")
    set shell=\"C:\Program\ Files\Git\git-bash.exe\"
else
    set shell=zsh
endif

if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=b
    set guioptions+=c

    set guioptions-=a
    set guioptions-=A
    set guioptions-=aA

    if has('win32')
        set guifont=Iosevka:h8:cANSI
    else
        set guifont=Iosevka\ 8
    endif

    set lines=40 columns=160
endif

set shortmess=lnrxI
set noshowmode
set showcmd
set modeline
set laststatus=2
set showtabline=0

set directory=~/.vim/swap,/tmp,/var/tmp

set tabpagemax=15

set number
set ruler
set noerrorbells
syntax on

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

set completeopt=longest,menuone,preview

set scrolloff=2
set sidescrolloff=2

set nospell
set spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

set tildeop

set wildmenu
set wildmode=list:longest,full

set formatoptions-=t
set textwidth=79
set nojoinspaces

set ignorecase
set smartcase
set nohlsearch
set incsearch
set magic
set gdefault

set whichwrap=~,[,]

set showmatch

set backspace=eol,start,indent

set cino=:0,g0,t0,(0,j1,+0

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:∘

command! W w !sudo tee % >/dev/null

cabbr <expr> %% expand('%:p:h')


" ********** KEY BINDINGS **********

let mapleader=","

" Disable middle-click-to-paste, middle-double-click-to-paste, ...
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>
:map <3-MiddleMouse> <Nop>
:imap <3-MiddleMouse> <Nop>
:map <4-MiddleMouse> <Nop>
:imap <4-MiddleMouse> <Nop>

inoremap jj <Esc>
inoremap kk <Esc>

nnoremap ' `
nnoremap ` '

map <silent> <F1> <nop>
map! <silent> <F1> <nop>

" vmap <silent> <leader>e c<C-r>=<C-r>"<CR><ESC>

nmap <silent> <leader>d <Plug>DashSearch

map <silent> <leader>bl :BuffergatorToggle<cr>
map <silent> <leader>bd <Plug>Kwbd

nmap <silent> <leader>tw :call ToggleWrap()<CR>
nmap <silent> <leader>ts :call ToggleSpell()<CR>

nmap <silent> <leader>[ :call SwitchToNextBuffer(-1)<CR>
nmap <silent> <leader>] :call SwitchToNextBuffer(1)<CR>

" Window creation mappings
map <silent> <leader>h :call WinMove('h')<cr>
map <silent> <leader>k :call WinMove('k')<cr>
map <silent> <leader>l :call WinMove('l')<cr>
map <silent> <leader>j :call WinMove('j')<cr>

" Window moving mappings
map <silent> <leader>H :wincmd H<cr>
map <silent> <leader>K :wincmd K<cr>
map <silent> <leader>L :wincmd L<cr>
map <silent> <leader>J :wincmd J<cr>

" Misc window mappings
map <silent> <leader>wc :wincmd q<cr>
map <silent> <leader>wo :only<cr>
map <silent> <leader>wr <C-W>r

" Fugitive mappings
map <silent> <leader>gs :Gstatus<cr>
map <silent> <leader>gc :Gcommit<cr>

" Buffer mappings
" map          <leader>b   <nop>
" map          <leader>be  :e<space>
" map          <leader>bs  :sp<space>
" map          <leader>bv  :vsp<space>
" map          <leader>bb  :b<space>
" map <silent> <leader>bp  :bp<cr>
" map <silent> <leader>bn  :bn<cr>
" map <silent> <leader>bd  :Kwbd<cr>
" map <silent> <leader>bwd :Kwbd<cr>:wincmd q<cr>
" map <silent> <leader>bwc :Kwbd<cr>:wincmd q<cr>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd " . a:key
    if (t:curwin == winnr()) "we havent moved
        if (match(a:key,'[jk]')) "were we going up/down
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

function! ToggleWrap(...)
    if (a:0 == 0 && &wrap) || get(a:000, 0, 1) == 0
        echo "Wrap OFF"
        setlocal nowrap
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! nunmap <buffer> k
        silent! nunmap <buffer> j
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        noremap  <buffer> <silent> k      gk
        noremap  <buffer> <silent> j      gj
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

function! ToggleSpell(...)
    if (a:0 == 0 && &spell) || get(a:000, 0, 1) == 0
        echo 'Spell Checking OFF'
        setlocal nospell
    else
        echo 'Spell Checking ON'
        setlocal spell
    endif
endfunction

function! PrintWrap()
    if &wrap
        return '[wrap]'
    endif

    return ''
endfunction

function! PrintSpell()
    if &spell
        return '[spell]'
    endif

    return ''
endfunction

function! SwitchToNextBuffer(incr)
    let help_buffer = (&filetype == 'help')
    let current = bufnr("%")
    let last = bufnr("$")
    let new = current + a:incr
    while 1
        if new != 0 && bufexists(new) && ((getbufvar(new, "&filetype") == 'help') == help_buffer)
            execute ":buffer ".new
            break
        else
            let new = new + a:incr
            if new < 1
                let new = last
            elseif new > last
                let new = 1
            endif
            if new == current
                break
            endif
        endif
    endwhile
endfunction

"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function! s:Kwbd(kwbdStage)
    if(a:kwbdStage == 1)
        if(!buflisted(winbufnr(0)))
            bd!
            return
        endif
        let s:kwbdBufNum = bufnr("%")
        let s:kwbdWinNum = winnr()
        windo call s:Kwbd(2)
        execute s:kwbdWinNum . 'wincmd w'
        let s:buflistedLeft = 0
        let s:bufFinalJump = 0
        let l:nBufs = bufnr("$")
        let l:i = 1
        while(l:i <= l:nBufs)
            if(l:i != s:kwbdBufNum)
                if(buflisted(l:i))
                    let s:buflistedLeft = s:buflistedLeft + 1
                else
                    if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
                        let s:bufFinalJump = l:i
                    endif
                endif
            endif
            let l:i = l:i + 1
        endwhile
        if(!s:buflistedLeft)
            if(s:bufFinalJump)
                windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
        else
            enew
            let l:newBuf = bufnr("%")
            windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
    endif
    execute s:kwbdWinNum . 'wincmd w'
endif
if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
    execute "bd! " . s:kwbdBufNum
endif
if(!s:buflistedLeft)
    set buflisted
    set bufhidden=delete
    set buftype=
    setlocal noswapfile
endif
  else
      if(bufnr("%") == s:kwbdBufNum)
          let prevbufvar = bufnr("#")
          if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
              b #
          else
              bn
          endif
      endif
  endif
endfunction

" TODO: Figure out what this is.
command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>


" ********** PLUGINS **********

" Specify a directory for plugins
if has('win32')
    call plug#begin('~/vimfiles/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Features
Plug 'airblade/vim-gitgutter'
Plug 'chrisbouchard/evaluate.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'kergoth/vim-hilinks'
Plug 'lukaszb/vim-web-indent'
Plug 'michaeljsmith/vim-indent-object'
Plug 'plytophogy/vim-virtualenv'
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/sudo.vim'
Plug 'vim-syntastic/syntastic'
Plug 'wellle/targets.vim'
Plug 'wesQ3/vim-windowswap'

" Syntax
Plug 'sheerun/vim-polyglot'
Plug 'justinmk/vim-syntax-extra'

" Colors
Plug 'whatyouhide/vim-gotham'

" FZF
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" Don't try to load the color scheme until *after* the plugin is loaded.
colorscheme gotham

