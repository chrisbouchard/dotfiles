local nvim_lsp = require('lspconfig')
local lsp_config = require('config.lsp')

for server, server_options in pairs(lsp_config.servers) do
    local options =
        vim.tbl_deep_extend('force', {}, lsp_config.base_options, server_options)
    nvim_lsp[server].setup(options)
end

