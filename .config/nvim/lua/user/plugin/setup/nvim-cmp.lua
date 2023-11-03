local config = require 'user.plugin.config.nvim-cmp'
local util = require 'user.plugin.util'

local depends_on = {
    ['L3MON4D3/LuaSnip'] = 'luasnip',
    ['hrsh7th/cmp-nvim-lsp'] = 'nvim_lsp',
    ['hrsh7th/cmp-buffer'] = 'buffer',
    ['hrsh7th/cmp-path'] = 'path',
    ['onsails/lspkind.nvim'] = true,
}

return {
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        config = config.nvim_cmp,
        dependencies = vim.tbl_keys(depends_on),
        opts = {
            sources = vim.tbl_filter(function(x)
                return x ~= nil
            end, vim.tbl_map(util.fn.map_name, vim.tbl_values(depends_on))),
        },
    },
}
