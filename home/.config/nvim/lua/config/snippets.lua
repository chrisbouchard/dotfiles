local M = {}

function M.setup()
    require('snippets').use_suggested_mappings()

    -- Copied from https://github.com/neovim/nvim-lspconfig/wiki/Snippets-support
    local capabilities = require('config.lsp').base_options.capabilities
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    return M
end

return M

