local M = {}

M.conform = function()
    local conform = require 'conform'
    conform.setup {
        notify_on_error = false,
        format_on_save = { lsp_fallback = true, timeout_ms = 500 },
        formatters_by_ft = {
            bash = { 'shfmt' },
            go = { 'gofumpt', 'goimports' },
            lua = { 'stylua' },
            sh = { 'shfmt' },
            ['_'] = { 'trim_whitespace' },
        },
    }
end

return M
