local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    return
end

treesitter.setup {
    ensure_installed = {
        'go',
        'gomod',
        'graphql',
        'json',
        'html',
        'lua',
        'prisma',
        'yaml',
        'rust',
        'cmake',
        'bash',
        'css',
        'dockerfile',
        'typescript',
        'tsx',
        'javascript',
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    autopairs = { enable = true },
}
