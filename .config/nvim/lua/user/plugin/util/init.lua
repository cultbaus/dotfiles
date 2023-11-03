local M = {}

M.mason = require 'user.plugin.util.mason'

M.mini = require 'user.plugin.util.mini'

M.fn = {
    map_name = function(value)
        if type(value) ~= 'string' then
            return
        end
        return { name = value }
    end,
    echo = function(msg, is_important)
        if type(msg) == 'string' then
            msg = { { msg } }
        end

        local max_width = vim.o.columns * vim.o.cmdheight + vim.v.echospace
        local tot_width, chunks = 0, {}

        for _, ch in ipairs(msg) do
            local part = vim.fn.strcharpart(ch[1], 0, max_width - tot_width)
            table.insert(chunks, { part, ch[2] })
            tot_width = tot_width + vim.fn.strdisplaywidth(part)
            if tot_width >= max_width then
                break
            end
        end

        vim.cmd 'redraw'
        vim.api.nvim_echo(chunks, is_important, {})
    end,
}

return M
