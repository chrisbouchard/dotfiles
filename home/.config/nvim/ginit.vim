set guifont=Iosevka\ SS09:h11

if exists('g:fvim_loaded')
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true

    nnoremap <F11> <cmd>FVimToggleFullScreen<CR>
endif
