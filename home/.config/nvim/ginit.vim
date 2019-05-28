if exists('g:GtkGuiLoaded')
    let g:GuiInternalClipboard = 1
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
endif

if exists('g:fvim_loaded')
    set guifont=Iosevka:h10
endif

