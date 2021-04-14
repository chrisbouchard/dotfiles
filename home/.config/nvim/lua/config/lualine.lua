local M = {}


local current_message = nil

local function lsp_message()
    local lsp_status = require('lsp-status')
    local messages = lsp_status.messages()

    if messages ~= nil and #messages > 0 then
        current_message = messages[1].title
    end

    return current_message
end


function M.setup()
    require('lualine').setup {
        options = {
            theme = 'gruvbox',
            section_separators = { '', '' },
            component_separators = { '', '' },
            icons_enabled = false,
        },
        sections = {
            lualine_a = {
                { 'mode', upper = true },
            },
            lualine_b = {
                { 'branch', icon = '', icons_enabled = true },
            },
            lualine_c = {
                { 'filename', file_status = true },
            },
            lualine_x = {
                {
                    lsp_message,
                    -- condition = function ()
                    --     return #vim.lsp.buf_get_clients() > 0
                    -- end,
                },
                'encoding',
                'fileformat',
                'filetype',
            },
            lualine_y = {
                {
                    'diagnostics',
                    sources = { 'nvim_lsp' },
                },
            },
            lualine_z = {
                { 'location', icons_enabled = true },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {
            'fugitive',
        }
    }

    return M
end


return M

