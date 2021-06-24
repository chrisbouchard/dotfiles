local nvim_lsp = require('lspconfig')

local M = {}

-- Server overrides
M.servers = {
    bashls = {},
    cssls = {},
    html = {},
    phpactor = {},
    pyls = {},
    rust_analyzer = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer" }
    },
    texlab = {},
    tsserver = {
        on_new_config = function (new_config)
            local pnp_root = nvim_lsp.util.search_ancestors(new_config.root_dir, function (path)
                local bin = nvim_lsp.util.path.join(path, ".yarn", "sdks", "typescript", "bin", "tsserver")
                if nvim_lsp.util.path.is_file(bin) then
                    return bin
                end
            end)

            if pnp_root then
                local pnp_tsserver = nvim_lsp.util.path.join(pnp_root, ".yarn", "sdks", "typescript", "bin", "tsserver")
                table.insert(new_config.cmd, "--tsserver-path")
                table.insert(new_config.cmd, pnp_tsserver)
            end
        end,
    },
    vimls = {},
}

M.base_options = {}


-- Lifted from https://github.com/neovim/nvim-lspconfig
-- TODO: Customize key mappings
function M.base_options.on_attach(client, bufnr)
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
end


function M.setup()
    -- Delay calling this in case the user configures LSP
    M.base_options.capabilities = vim.lsp.protocol.make_client_capabilities()
    return M
end


return M

