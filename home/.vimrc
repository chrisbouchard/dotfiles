call pathogen#infect()

set nocompatible
set encoding=utf-8
set updatecount=0
set autoread

if &term =~ "screen.*" && len($TMUX) > 0
    set t_ts=]2;
    set t_fs=\\
endif
set title

filetype plugin indent on

" autocmd! bufwritepost .vimrc source ~/.vimrc
" autocmd bufwritepost .vimrc colorscheme ir_black

"au BufAdd,BufNewFile * nested tab sball

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

"au FileType tex setlocal makeprg=pdflatex\ -interaction\ nonstopmode\ $*\ %

let $PAGER=''

let mapleader=","
let vimpager_use_gvim=1

let g:EnhCommentifyRespectIndent='yes'
let g:EnhCommentifyPretty='yes'
let g:EnhCommentifyMultiPartBlocks='yes'
let g:EnhCommentifyUseSyntax='yes'

let g:buffergator_suppress_keymaps=1
let g:buffergator_autoexpand_on_split=0

let g:SuperTabDefaultCompletionType = 'context'

let g:snips_author = 'Chris J. Bouchard'

let g:Powerline_symbols = 'unicode'
let g:Powerline_dividers_override = ['▖', '┊', '▗', '┊']

"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1

let g:dbext_default_profile_aptify = 'type=ODBC:integratedlogin=1:srvname=nyahsasql-01'

let g:xmledit_enable_html = 1

let g:jedi#use_tabs_not_buffers = 0

let g:syntastic_python_python_exe = 'python3'
let g:syntastic_python_checkers = ['pylint']

set background=dark
colorscheme ir_black

set autochdir
set nobackup
set shell=zsh
set hidden
set cursorline
"set lazyredraw
set ttymouse=xterm2
set mouse=a

set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=b
set guioptions+=c

if !has("gui_macvim")
    set guifont=Terminus\ 8
endif

set shortmess=lnrxI
set noshowmode
"set showmode
set showcmd
set modeline
set laststatus=2
"set statusline=%<%F%m%r\ %y[%{&ff}]%{PrintWrap()}%{PrintSpell()}%h%w%=L%l/%L\ C%c%V\ %P
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

"set whichwrap=h,l,~,[,]
set whichwrap=~,[,]

set showmatch

set backspace=eol,start,indent

set cino=:0,g0,t0,(0,j1,+0

set list
set listchars=tab:▸\ ,trail:⋅,nbsp:∘

"set colorcolumn=80
"highlight colorcolumn ctermbg=233 guibg=#050505

highlight OverLength ctermbg=darkred ctermfg=white guibg=#441111
match OverLength /\%81v.\+/

command! W w !sudo tee % >/dev/null

command! Make make -C ..

let &makeprg = 'if [ -f Makefile ]; then make; else make -C ..; fi'

" Disable middle-click-to-paste, middle-double-click-to-paste, ...
:map <MiddleMouse> <Nop>
:imap <MiddleMouse> <Nop>
:map <2-MiddleMouse> <Nop>
:imap <2-MiddleMouse> <Nop>
:map <3-MiddleMouse> <Nop>
:imap <3-MiddleMouse> <Nop>
:map <4-MiddleMouse> <Nop>
:imap <4-MiddleMouse> <Nop>

noremap ; :
inoremap jj <Esc>
inoremap kk <Esc>

"nmap <silent> . .`[

nnoremap ' `
nnoremap ` '

map <silent> <F1> <nop>
map! <silent> <F1> <nop>

" inoremap <silent> <tab> <C-n>
" inoremap <silent> <S-tab> <C-p>

vmap <silent> <leader>e c<C-r>=<C-r>"<CR><ESC>

nmap <silent> <leader>d <Plug>DashSearch

map <silent> <leader>bl :BuffergatorToggle<cr>
map <silent> <leader>bd :<C-u>Kwbd<cr>

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


" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
" normal mode
nmap <silent> <Left> <<gv
nmap <silent> <Right> >>gv
nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

" visual mode
vmap <silent> <Left> <gv
vmap <silent> <Right> >gv
vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv

" insert mode
imap <silent> <Left> <C-D>
imap <silent> <Right> <C-T>
inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

" disable modified versions we are not using
nnoremap  <S-Up>     <Up>
nnoremap  <S-Down>   <Down>
nnoremap  <S-Left>   <Left>
nnoremap  <S-Right>  <Right>
vnoremap  <S-Up>     <Up>
vnoremap  <S-Down>   <Down>
vnoremap  <S-Left>   <Left>
vnoremap  <S-Right>  <Right>
inoremap  <S-Up>     <Up>
inoremap  <S-Down>   <Down>
inoremap  <S-Left>   <Left>
inoremap  <S-Right>  <Right>


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

function! DelEmptyLineAbove()
    if line(".") == 1
        return
    endif
    let l:line = getline(line(".") - 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .-1d
        silent normal! <C-y>
        call cursor(line("."), l:colsave)
    endif
endfunction
 
function! AddEmptyLineAbove()
    let l:scrolloffsave = &scrolloff
    " Avoid jerky scrolling with ^E at top of window
    set scrolloff=0
    call append(line(".") - 1, "")
    if winline() != winheight(0)
        silent normal! <C-e>
    endif
    let &scrolloff = l:scrolloffsave
endfunction
 
function! DelEmptyLineBelow()
    if line(".") == line("$")
        return
    endif
    let l:line = getline(line(".") + 1)
    if l:line =~ '^\s*$'
        let l:colsave = col(".")
        .+1d
        ''
        call cursor(line("."), l:colsave)
    endif
endfunction
 
function! AddEmptyLineBelow()
    call append(line("."), "")
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

command! Kwbd call s:Kwbd(1)
"nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>
