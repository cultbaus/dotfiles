local M = {}

M.setup = function(lsp_opts)
    return {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            lsp_opts.on_attach(client)
        end,
        settings = {
            ['rust-analyzer'] = {
                assist = {
                    importMergeBehavior = 'last',
                    importPrefix = 'by_self',
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    }
end

return M
