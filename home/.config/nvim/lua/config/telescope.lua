local telescope = require 'telescope'

-- Load telescope_lsp_handlers extension
telescope.load_extension('lsp_handlers')

local key_prefix = [[<Leader>f]]
local command_prefix = [[<Cmd>Telescope ]]
local command_suffix = [[<CR>]]

function set_telescope_keymap(key, command)
    local full_key = key_prefix .. key
    local full_command = command_prefix .. command .. command_suffix

    vim.api.nvim_set_keymap('n', full_key, full_command, {
        noremap = true,
        silent = true,
    })
end

set_telescope_keymap('b', 'buffers')
set_telescope_keymap('f', 'find_files')
set_telescope_keymap('g', 'live_grep')
set_telescope_keymap('h', 'help_tags')
set_telescope_keymap('p', 'git_files')

