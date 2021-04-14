local M = {}

function M.setup()
    local lsp_status = require('lsp-status')
    local lsp_config = require('config.lsp')

    lsp_status.config {
        indicator_errors = 'E',
        indicator_warnings = 'W',
        indicator_info = 'i',
        indicator_hint = '?',
        indicator_ok = 'Ok',
    }

    lsp_status.register_progress()

    lsp_config.base_options.capabilities =
        vim.tbl_deep_extend(
            'keep',
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

