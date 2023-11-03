local M = {}

M.lsp_config = function()
    vim.diagnostic.config {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true,
        float = { border = 'single' },
    }
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'single',
    })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'single',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
        pattern = { '<buffer>' },
        command = 'silent! lua vim.diagnostic.open_float({ focusable = false, focus = false })',
    })
    vim.fn.sign_define('DiagnosticSignError', { text = ' E', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' W', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' I', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = ' H', texthl = 'DiagnosticSignHint' })
end

M.lsp_keys = {
    { 'gd', vim.lsp.buf.definition },
    { 'gf', vim.lsp.buf.formatting },
    { 'gr', vim.lsp.buf.references },
    { 'K', vim.lsp.buf.hover },
    { 'qf', vim.lsp.buf.code_action },
    { '<leader>rn', vim.lsp.buf.rename },
    { 'fne', vim.diagnostic.goto_next },
    { 'fpe', vim.diagnostic.goto_prev },
}

return M
