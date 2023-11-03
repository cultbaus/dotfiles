local util = require 'user.plugin.util'

local M = {}

M.ai = function()
    local ai = require 'mini.ai'
    ai.setup {
        n_lines = 500,
        custom_textobjects = {
            o = ai.gen_spec.treesitter({
                a = { '@block.outer', '@conditional.outer', '@loop.outer' },
                i = { '@block.inner', '@conditional.inner', '@loop.inner' },
            }, {}),
            f = ai.gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
            c = ai.gen_spec.treesitter({ a = '@class.outer', i = '@class.inner' }, {}),
            t = { '<([%p%w]-)%f[^<%w][^<>]->.-</%1>', '^<.->().*()</[^/]->$' },
        },
        silent = true,
    }
end

M.base16 = function()
    local base16 = require 'mini.base16'
    local diagnostic = {
        error = '#FF5900',
        warn = '#FFD400',
        info = '#00FF64',
        hint = '#00FFE5',
    }
    local palette = C.palette
    base16.setup {
        palette = palette,
        use_cterm = false,
        plugins = {
            default = true,
        },
    }

    -- base ui
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE', fg = palette.base07, bold = true })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'MatchParen', { bg = palette.base01, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'TabLine', { bg = 'NONE', fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'TabLineSel', { bg = 'NONE', fg = palette.base04, bold = true })
    vim.api.nvim_set_hl(0, 'TabLineFill', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'Comment', { fg = palette.base02 })

    -- spell
    vim.api.nvim_set_hl(0, 'SpellBad', { fg = diagnostic.error, underline = true })
    vim.api.nvim_set_hl(0, 'SpellRare', { fg = diagnostic.warn, underline = true })

    -- mini.pick
    vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = palette.base01 })
    vim.api.nvim_set_hl(0, 'MiniPickMatchRanges', { fg = palette.base06, bold = true })
    vim.api.nvim_set_hl(0, 'MiniPickNormal', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorder', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorderBusy', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickBorderText', { bg = palette.base00, fg = palette.base04 })
    vim.api.nvim_set_hl(0, 'MiniPickPrompt', { bg = palette.base00, fg = palette.base04 })

    -- diagnostic
    vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = diagnostic.error, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = diagnostic.warn, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = diagnostic.info, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = diagnostic.hint, bg = 'NONE' })

    vim.api.nvim_set_hl(0, 'DiagnosticFloatingError', { fg = diagnostic.error, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingWarn', { fg = diagnostic.warn, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingInfo', { fg = diagnostic.info, bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'DiagnosticFloatingHint', { fg = diagnostic.hint, bg = 'NONE' })

    -- nvim-cmp
    vim.api.nvim_set_hl(0, 'CmpItemMenu', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = palette.base06, bg = 'NONE', bold = true })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = palette.base06, bg = 'NONE', bold = true })
end

M.comment = function()
    local comment = require 'mini.comment'
    comment.setup {
        mappings = {
            comment = 'gc',
            comment_line = 'gcc',
        },
    }
end

M.pick = function()
    local pick = require 'mini.pick'
    pick.setup {
        mappings = {
            move_down = '<C-j>',
            move_up = '<C-k>',
        },
        window = { config = util.mini.window_config },
    }
end

M.pick_keys = {
    {
        '<C-p>',
        function()
            require('mini.pick').builtin.files { tool = 'git' }
        end,
    },
    {
        '<C-g>',
        function()
            require('mini.pick').builtin.grep_live { tool = 'rg' }
        end,
    },
    {
        'fae',
        function()
            local mini_pick = require 'mini.pick'
            local diagnostics = util.mini.get_diagnostics()
            if #diagnostics == 0 then
                util.fn.echo({ { 'No errors found', 'DiagnosticInfo' } }, true)
                return
            end
            require('mini.pick').start {
                source = {
                    items = diagnostics,
                    name = 'Diagnostics',
                    show = function(bufnr, results, query)
                        local lines, extmarks =
                            util.mini.get_lines_and_extmarks(results, util.mini.make_diagnostics_prefix)
                        mini_pick.default_show(bufnr, lines, query)
                        util.mini.set_extmarks(bufnr, extmarks, vim.api.nvim_create_namespace 'DiagnosticError')
                    end,
                },
            }
        end,
    },
}

return M
