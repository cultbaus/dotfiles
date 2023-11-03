local M = {}

M.nvim_cmp = function(_, opts)
    local snip = require 'luasnip'
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    cmp.setup {
        snippet = {
            expand = function(args)
                snip.lsp_expand(args.body)
            end,
        },
        window = {
            documentation = cmp.config.window.bordered { border = 'single' },
            completion = cmp.config.window.bordered {
                border = 'single',
                side_padding = 0,
            },
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(entry, vim_item)
                local kind = lspkind.cmp_format { mode = 'symbol_text', maxwidth = 50 }(entry, vim_item)
                local strings = vim.split(kind.kind, '%s', { trimempty = true })
                kind.kind = ' ' .. (strings[1] or '') .. ' '
                kind.menu = '    [' .. (strings[2] or '') .. ']'
                return kind
            end,
        },
        mapping = {
            ['<Tab>'] = require('cmp').mapping.select_next_item(),
            ['<S-Tab>'] = require('cmp').mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping {
                i = function(fallback)
                    if cmp.visible() then
                        cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true }
                    else
                        fallback()
                    end
                end,
                s = cmp.mapping.confirm { select = true },
                c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
            },
        },
        sources = opts.sources,
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                function(a, b)
                    local _, a_under = a.completion_item.label:find '^_+'
                    local _, b_under = b.completion_item.label:find '^_+'
                    a_under = a_under or 0
                    b_under = b_under or 0
                    if a_under > b_under then
                        return false
                    elseif a_under < b_under then
                        return true
                    end
                end,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        experimental = {
            ghost_text = false,
        },
    }
end

return M
