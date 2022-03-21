local M = {}
local fmt = string.format

local commands = {
    javascript = 'node %s',
    typescript = 'ts-node %s',
    go = 'go run %s',
    rust = 'cargo run %s',
    cpp = 'gcc %s && ./a.out',
    lua = 'luajit %s',
    ruby = 'ruby %s',
}

local terminal_wrapper = function(command, file)
    vim.cmd 'new'
    vim.cmd('term ' .. fmt(command, file))
    vim.cmd('silent! file Running ' .. file)
    vim.cmd 'set nobuflisted'
    vim.cmd 'setl nornu nonu nocul so=0 scl=no'
    vim.cmd 'startinsert'
end

M.compile_and_run = function()
    local filetype = vim.bo.filetype
    if commands[filetype] then
        terminal_wrapper(commands[filetype], vim.fn.expand '%')
    else
        print(fmt('Filetype "%s" is not yet supported.', filetype))
    end
end

return M
