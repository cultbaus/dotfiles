local config = require 'user.plugin.config.nvim-treesitter'

return {
    {
        'nvim-treesitter/nvim-treesitter',
        config = config.treesitter,
        dependencies = {
            { 'nvim-treesitter/nvim-treesitter-textobjects' },
        },
    },
}
