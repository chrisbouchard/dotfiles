set guifont=Iosevka\ SS09\ Regular:h12

if exists('g:GtkGuiLoaded')
    call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)
endif

