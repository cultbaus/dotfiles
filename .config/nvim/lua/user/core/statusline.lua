local modes = {
    ['n'] = 'NORMAL',
    ['v'] = 'VISUAL',
    ['V'] = 'VISUAL LINE',
    [''] = 'VISUAL BLOCK',
    ['i'] = 'INSERT',
    ['ic'] = 'INSERT',
    ['R'] = 'REPLACE',
    ['c'] = 'COMMAND',
    ['t'] = 'TERMINAL',
}

local colors = {
    ['n'] = '%#StatuslineAccent#',
    ['i'] = '%#StatuslineInsertAccent#',
    ['ic'] = '%#StatuslineInsertAccent#',
    ['v'] = '%#StatuslineVisualAccent#',
    ['V'] = '%#StatuslineVisualAccent#',
    [''] = '%#StatuslineVisualAccent#',
    ['R'] = '%#StatuslineReplaceAccent#',
    ['c'] = '%#StatuslineCmdLineAccent#',
    ['t'] = '%#StatuslineTerminalAccent#',
    default = '%#StatusLineAccent#',
}

local diagnostics_info = {
    errors = { severity = 'Error', symbol = '⚠️ ' },
    warnings = { severity = 'Warn', symbol = '⚠️ ' },
    info = { severity = 'Info', symbol = '💡' },
    hints = { severity = 'Hint', symbol = '💡' },
}

local get_filepath = function()
    local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')
    return (fpath == '' or fpath == '.') and ' ' or string.format(' %%<%s/', fpath)
end

local get_filename = function()
    local fname = vim.fn.expand '%:t'
    return fname == '' and '' or fname .. ' '
end

local format_diagnostics = function(_, value)
    local count = vim.tbl_count(vim.diagnostic.get(0, { severity = value.severity }))
    if count ~= 0 then
        return string.format(' %%#Diagnostic%s#%s%d', value.severity, value.symbol, count)
    else
        return ''
    end
end

local get_lsp_diagnostics = function()
    local diagnostics = vim.iter(diagnostics_info):map(format_diagnostics):fold('', function(acc, cv)
        return acc .. cv
    end)
    return diagnostics .. '%#Normal#'
end

Statusline = {
    active = function()
        local current_mode = vim.api.nvim_get_mode().mode
        local mode_color = colors[current_mode] or colors.default
        local mode_name = string.format(' %s ', modes[current_mode] or ''):upper()
        local filetype = string.format(' %s ', vim.bo.filetype):upper()
        local lineinfo = vim.bo.filetype == 'alpha' and '' or ' %P %#Normal# %l:%c '

        return '%#Statusline#'
            .. mode_color
            .. mode_name
            .. '%#Normal#'
            .. get_filepath()
            .. get_filename()
            .. '%#Normal#'
            .. get_lsp_diagnostics()
            .. '%=%#StatusLineExtra#'
            .. filetype
            .. lineinfo
    end,
    inactive = function()
        return '%#Normal#' .. ' %F'
    end,
}

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
    pattern = { '*' },
    callback = function()
        vim.wo.statusline = '%!v:lua.Statusline.active()'
    end,
})
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
    pattern = { '*' },
    callback = function()
        vim.wo.statusline = '%!v:lua.Statusline.inactive()'
    end,
})
