local M = {}

M.setup = function(lsp_opts)
    return {
        capabilities = lsp_opts.capabilities,
        on_attach = function(client)
            lsp_opts.on_attach(client)
        end,
        root_dir = require('lspconfig').util.root_pattern '.git/',
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = {
                        [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                        [vim.fn.stdpath 'config' .. '/lua'] = true,
                    },
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

return M
