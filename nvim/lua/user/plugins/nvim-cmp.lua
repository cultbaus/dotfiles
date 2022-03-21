local ok, cmp = pcall(require, 'cmp')
if not ok then
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = require('cmp').mapping.select_next_item(),
        ['<CR>'] = require('cmp').mapping.confirm { select = false },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
}
