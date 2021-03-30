local nvim_lsp = require('lspconfig')

-- Status line integration
local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- Server overrides
local servers = {
    bashls = {},
    cssls = {},
    html = {},
    pyls = {},
    rust_analyzer = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer" }
    },
    texlab = {},
    vimls = {},
}

-- Lifted from https://github.com/neovim/nvim-lspconfig
-- TODO: Customize key mappings
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- These use Telescope for preview
    buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', '<M-CR>', '<cmd>Telescope lsp_code_actions theme=get_dropdown<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59
            highlight! link LspReferenceText LspReference
            highlight! link LspReferenceRead LspReference
            highlight! link LspReferenceWrite LspReference
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end

    if client.resolved_capabilities.code_action then
        vim.api.nvim_exec([[
            augroup lsp_code_action_lightbulb
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua require'nvim-lightbulb'.update_lightbulb()
            augroup END
        ]], false)
    end
end

-- Depends on snippets.nvim
-- Copied from https://github.com/neovim/nvim-lspconfig/wiki/Snippets-support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local base_options = {
    capabilities = capabilities,
    on_attach = function(...)
        on_attach(...)
        lsp_status.on_attach(...)
    end,
}

for server, server_options in pairs(servers) do
    local options = vim.tbl_deep_extend('force', base_options, server_options)
    nvim_lsp[server].setup(options)
end

