local M = {}

M.setup = function(config)
    return {
        capabilities = config.capabilities,
        on_attach = function(client)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end

            config.on_attach(client)
        end,
        handlers = {
            ['textDocument/publishDiagnostics'] = function() end,
        },
    }
end

return M
