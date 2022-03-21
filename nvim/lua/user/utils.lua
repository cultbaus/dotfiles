local M = {}

local function map(mode, input, output, options)
    vim.api.nvim_set_keymap(mode, input, output, options)
end

local function noremap(mode, input, output, opts)
    map(mode, input, output, opts or { noremap = true })
end

local function snoremap(mode, input, output)
    noremap(mode, input, output, { noremap = true, silent = true })
end

M.map = map

M.nnoremap = function(input, output)
    noremap('n', input, output)
end

M.inoremap = function(input, output)
    noremap('i', input, output)
end

M.vnoremap = function(input, output)
    noremap('v', input, output)
end

M.tnoremap = function(input, output)
    noremap('t', input, output)
end

M.snnoremap = function(input, output)
    snoremap('n', input, output)
end

M.sinoremap = function(input, output)
    snoremap('i', input, output)
end

M.svnoremap = function(input, output)
    snoremap('v', input, output)
end

M.stnoremap = function(input, output)
    snoremap('t', input, output)
end

M.nmap = function(input, output)
    map('n', input, output)
end

M.imap = function(input, output)
    map('i', input, output)
end

M.vmap = function(input, output)
    map('v', input, output)
end

M.tmap = function(input, output)
    map('t', input, output)
end

M.iexnoremap = function(input, output)
    map('i', input, output, { expr = true, noremap = true })
end

M.is_git_dir = os.execute 'git rev-parse --is-inside-work-tree >> /dev/null 2>&1'

M.data = vim.fn.stdpath 'data'

M.tt = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.config = function(name)
    return require(string.format('user.plugins.%s', name))
end

_G.smart_tab = function()
    return vim.fn.pumvisible() == 1 and M.tt '<C-n>' or M.tt '<Tab>'
end

_G.smart_enter = function()
    return vim.fn.pumvisible() == 1 and M.tt '<C-y>' or M.tt '<CR>'
end

return M
