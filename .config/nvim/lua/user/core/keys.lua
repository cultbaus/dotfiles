vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })

vim.keymap.set('n', '<leader>p', '"0p')
vim.keymap.set('n', 'q:', ':q')

vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('t', '<ESC>', [[<C-\><C-n>]])

vim.api.nvim_create_user_command('W', 'w', { nargs = '*' })

vim.api.nvim_create_user_command('Wq', 'wq', { nargs = '*' })
vim.api.nvim_create_user_command('Wq', 'wq!', { bang = true, nargs = '*' })

vim.api.nvim_create_user_command('Q', 'q', { nargs = '*' })
vim.api.nvim_create_user_command('Q', 'q!', { bang = true, nargs = '*' })
