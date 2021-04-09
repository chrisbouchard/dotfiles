local M = {}

function M.setup()
    require('rust-tools').setup({
        autoSetHints = true,
    })

    return M
end

return M

