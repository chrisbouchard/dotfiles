set guifont=Iosevka\ SS09:h14

if exists('g:fvim_loaded')
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true

    nnoremap <F11> <cmd>FVimToggleFullScreen<CR>
endif
