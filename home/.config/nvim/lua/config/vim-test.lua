local M = {}


function M.setup()
    local opts = { noremap=true, silent=false }

    vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>TestNearest<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>TestFile<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>ts', '<cmd>TestSuite<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tl', '<cmd>TestLast<CR>', opts)
    vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>TestVisit<CR>', opts)

    vim.g['test#strategy'] = 'neovim'
    vim.g['test#neovim#term_position'] = 'vert botright 80'
end


return M
