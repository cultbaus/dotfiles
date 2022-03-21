local M = {}

M.setup = function(config)
    return {
        on_attach = function(client, bufnr)
            config.on_attach(client, bufnr)
            vim.o.list = false
        end,
        cmd = { 'gopls', 'serve' },
        settings = {
            gopls = {
                analyses = {
                    unusedparams = false,
                },
                staticcheck = true,
            },
        },
    }
end

return M
