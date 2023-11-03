local M = {}

M.treesitter = function()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {
            'bash',
            'diff',
            'gitignore',
            'go',
            'lua',
            'markdown',
            'markdown_inline',
            'regex',
            'sql',
            'toml',
            'yaml',
            'json',
        },
        highlight = { enable = true },
        indent = { enable = false },
        autopairs = { enable = true },
    }
end

return M
