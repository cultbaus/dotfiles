local M = {}

M.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.on_attach = function(client)
    if client.name ~= 'null-ls' then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.range_formatting = false
    end

    client.resolved_capabilities.document_highlighting = false

    vim.cmd [[
        augroup HoverDiagnostics
            au!
            au CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })
        augroup END
    ]]

    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
            augroup Format
                au! * <buffer>
                au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
            augroup END
        ]]
    end
end

return M
