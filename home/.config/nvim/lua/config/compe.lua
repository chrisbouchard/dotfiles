local compe = require 'compe'

compe.setup {
    enabled = true,
    documentation = true,
    source = {
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
        path = true,
        spell = true,
    },
}

function set_compe_keymap(key, mapping)
    vim.api.nvim_set_keymap('i', key, mapping, {
        noremap = true,
        silent = true,
        expr = true
    })
end

set_compe_keymap([[<C-Space>]], [[compe#complete()]])
-- This assumes that the Lexima mappings have already been set. The sequencing
-- is handled by Packer.
set_compe_keymap([[<CR>]], [[compe#confirm(lexima#expand('<LT>CR>', 'i'))]])
set_compe_keymap([[<C-e>]], [[compe#close('<C-e>')]])
set_compe_keymap([[<C-f>]], [[compe#scroll({ 'delta': +4 })]])
set_compe_keymap([[<C-d>]], [[compe#scroll({ 'delta': -4 })]])

