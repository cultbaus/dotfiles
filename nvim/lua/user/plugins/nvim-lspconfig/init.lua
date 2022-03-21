local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    return
end

local diagnostics = vim.lsp.diagnostic.on_publish_diagnostics

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(diagnostics, {
    signs = true,
    virtual_text = false,
    update_in_insert = true,
    underline = true,
})

-- Null is a standalone server, so it needs it's own special config
null_ls.setup {
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd [[
            augroup Format
                au! * <buffer>
                au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
            augroup END
        ]]
        end
    end,
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt.with {
            args = { '-i', '2', '-ci' },
        },
        null_ls.builtins.formatting.rufo,
    },
}
