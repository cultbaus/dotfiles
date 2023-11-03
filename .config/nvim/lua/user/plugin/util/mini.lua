local M = {}

M.window_config = function()
    local height = math.floor(0.618 * vim.o.lines)
    local width = math.floor(0.618 * vim.o.columns)
    return {
        anchor = 'NW',
        height = height,
        width = width,
        row = math.floor(0.5 * (vim.o.lines - height)),
        col = math.floor(0.5 * (vim.o.columns - width)),
    }
end

M.get_diagnostics = function()
    return vim.tbl_map(function(err)
        return { bufnr = err.bufnr, lnum = err.lnum, col = err.col, text = err.message }
    end, vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR }))
end

M.set_extmarks = function(bufnr, extmarks, ns_id)
    for i, end_col in ipairs(extmarks) do
        vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, { end_col = end_col, hl_group = 'DiagnosticError' })
    end
end

M.make_diagnostics_prefix = function(diagnostic)
    local file = vim.fn.fnamemodify(vim.fn.bufname(diagnostic.bufnr), ':t')
    return string.format('[%s:%s:%s] ', file, diagnostic.lnum, diagnostic.col)
end

M.get_lines_and_extmarks = function(items, make_prefix)
    local lines, extmarks = {}, {}
    for index, item in ipairs(items) do
        local prefix = make_prefix(item)
        local line = prefix .. item.text
        lines[index] = line
        if #prefix <= #line then
            extmarks[index] = #prefix
        end
    end
    return lines, extmarks
end

return M
