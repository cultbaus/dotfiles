local ok, lsp_status = pcall(require, 'lsp-status')
if not ok then
    local M = {}
    M.render = function()
        return ''
    end
    return M
end

local M = {}

local mode_map = {
    ['n'] = 'normal',
    ['v'] = 'visual',
    ['V'] = 'visual',
    [''] = 'visual',
    ['i'] = 'insert',
    ['ic'] = 'insert',
    ['ix'] = 'insert',
    ['R'] = 'replace',
    ['Rv'] = 'replace',
    ['c'] = 'command',
}

-- Current mode
local function cursor_mode()
    local m = vim.api.nvim_get_mode()
    local current_mode = mode_map[m.mode]

    return string.format(' %s ', current_mode)
end

-- File name
local function filename()
    local bufname = vim.fn.expand '%:t'
    return bufname and string.format('%s ', bufname) or ''
end

-- Linter status
local function lsp()
    local diagnostics = lsp_status.diagnostics()
    local result = string.format('%d %d ', diagnostics.errors, diagnostics.warnings)
    local should_count = diagnostics.errors > 0 or diagnostics.warnings > 0

    return should_count and result or 'Nil '
end

-- Render the statusline
function M.render()
    local status = ''

    -- left side
    status = status .. '%#DiffDelete#'
    status = status .. cursor_mode()
    status = status .. '%#NonText# '
    status = status .. filename()
    status = status .. '%8*' .. ' '
    status = status .. '%*%-m %-r'

    -- right side
    status = status .. '%='
    status = status .. ' %l/%L '
    status = status .. '%#TermCursor# '
    status = status .. lsp() .. '%*'

    return status
end

return M
