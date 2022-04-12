local ok, null_ls = pcall(require, 'null-ls')
if not ok then
    return
end

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
}

-- Null is a standalone server, so it needs it's own special config
null_ls.setup {
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd [[
            augroup Format
                au! * <buffer>
                au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]]
        end
    end,
    diagnostics_format = '[#{c}] #{m} (#{s})',
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
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
