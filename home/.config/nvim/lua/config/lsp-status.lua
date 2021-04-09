local M = {}

function M.setup()
    local lsp_status = require('lsp-status')
    local lsp_config = require('config.lsp')

    lsp_status.register_progress()

    -- TODO: Does this modify the first argument in-place?
    vim.tbl_extend('keep',
        lsp_config.base_options.capabilities,
        lsp_status.capabilities
    )

    local original_on_attach = lsp_config.base_options.on_attach
    lsp_config.base_options.on_attach =
        function (...)
            original_on_attach(...)
            lsp_status.on_attach(...)
        end

    return M
end

return M

