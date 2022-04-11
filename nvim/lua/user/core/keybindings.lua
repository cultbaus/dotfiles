local utils = require 'user.utils'

vim.g.mapleader = '\\'

-- Enter normal mode
utils.inoremap('jk', '<ESC>')

-- Map escape from terminal input to Normal mode
utils.tnoremap('<ESC>', [[<C-\><C-n>]])
utils.tnoremap('jk', [[<C-\><C-n>]])

-- Neogit
utils.snnoremap('<leader>gs', '<cmd>lua require"neogit".open()<CR>')

-- LSP
utils.snnoremap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.snnoremap('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.snnoremap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.snnoremap('qf', '<cmd>lua vim.lsp.buf.code_action()<CR>')
utils.snnoremap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Fuzzyfinding
utils.nnoremap('<C-p>', [[<cmd>lua require'user.plugins.nvim-telescope.commands'.find_files_m()<CR>]])
utils.nnoremap('<C-g>', [[<cmd>lua require'user.plugins.nvim-telescope.commands'.live_grep()<CR>]])

-- Completion
utils.iexnoremap('<Enter>', 'v:lua.smart_enter()')
utils.iexnoremap('<Tab>', 'v:lua.smart_tab()')

-- Run current file (mostly just for scratch)
utils.nnoremap('=', '<cmd>lua require"user.core.compiler".compile_and_run()<CR>')

-- Terminal tab
utils.snnoremap('<leader>te', '<cmd>lua require"user.core.compiler".start_terminal()<CR>')

-- Create a new file adjacent to current buffer
utils.nnoremap('<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')

-- Ends my suffering
utils.nnoremap('q:', ':q')
