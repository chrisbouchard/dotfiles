local M = {}

local function on_attach(client, bufnr)
    if client.resolved_capabilities.code_action then
        vim.api.nvim_exec([[
            augroup lsp_code_action_lightbulb
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua require('nvim-lightbulb').update_lightbulb()
            augroup END
        ]], false)
    end
end

function M.setup()
    local lsp_config = require('config.lsp')
    local original_on_attach = lsp_config.base_options.on_attach

    function lsp_config.base_options.on_attach(...)
        original_on_attach(...)
        lsp_status.on_attach(...)
    end

    return M
end

return M

