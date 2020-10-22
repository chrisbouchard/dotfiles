local nvim_lsp = require 'nvim_lsp'

local on_attach = function (client)
    require'completion'.on_attach(client)
    require'diagnostic'.on_attach(client)
end


nvim_lsp.bashls.setup {
    on_attach=on_attach,
}

nvim_lsp.cssls.setup {
    on_attach=on_attach,
}
nvim_lsp.html.setup {
    on_attach=on_attach,
}

nvim_lsp.pyls.setup {
    on_attach=on_attach,
}

nvim_lsp.rust_analyzer.setup {
    on_attach=on_attach,
    on_new_config = function (config)
        if vim.fn.executable('rustup') > 0 then
            config.cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' }
        end
    end,
}

nvim_lsp.solargraph.setup {
    on_attach=on_attach,
}

nvim_lsp.texlab.setup {
    on_attach=on_attach,
    settings = {
        latex = {
            build = {
                args = { "-pdfxe", "-interaction=nonstopmode" }
            }
        }
    }
}

nvim_lsp.tsserver.setup {
    on_attach=on_attach,
    on_new_config = function (config)
        -- TODO: Use root_dir when nvim-lspconfig#301 is merged
        local sdk_dir = vim.fn.getcwd() .. '/.yarn/sdks'
        if vim.fn.executable(sdk_dir .. '/typescript-language-server/lib/cli.js') > 0 then
            config.cmd = {
                sdk_dir .. '/typescript-language-server/lib/cli.js',
                '--tsserver-path=' .. sdk_dir .. '/typescript/bin/tsserver',
                '--stdio',
            }
        end
    end
}

nvim_lsp.vimls.setup {
    on_attach=on_attach,
}

