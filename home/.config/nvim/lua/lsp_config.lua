local nvim_lsp = require 'nvim_lsp'

nvim_lsp.bashls.setup {}
nvim_lsp.cssls.setup {}
nvim_lsp.html.setup {}
nvim_lsp.pyls.setup {}

nvim_lsp.rust_analyzer.setup {
    on_new_config = function (config)
        if vim.fn.executable('rustup') > 0 then
            config.cmd = { 'rustup', 'run', 'nightly', 'rust-analyzer' }
        end
    end
}

nvim_lsp.solargraph.setup {}
nvim_lsp.texlab.setup {}

nvim_lsp.tsserver.setup {
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

nvim_lsp.vimls.setup {}

