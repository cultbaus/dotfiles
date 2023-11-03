local M = {}

local setup_server = function(server_name, capabilities, config)
    local lspconfig = require 'lspconfig'
    config.capabilities = capabilities
    lspconfig[server_name].setup(config)
end

M.make_handlers = function(capabilities)
    local handlers = {}

    handlers[1] = function(server_name)
        setup_server(server_name, capabilities, {})
    end

    handlers.gopls = function()
        setup_server('gopls', capabilities, {
            on_attach = function()
                vim.o.list = false
            end,
            settings = {
                gopls = {
                    gofumpt = true,
                    analyses = {
                        unreachable = true,
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
        })
    end

    handlers.lua_ls = function()
        local path = vim.split(package.path, ';')
        table.insert(path, 'lua/?.lua')
        table.insert(path, 'lua/?/init.lua')

        setup_server('lua_ls', capabilities, {
            root_dir = require('lspconfig').util.root_pattern '.git/',
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                        path = path,
                    },
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    workspace = {
                        checkThirdParty = false,
                        maxPreload = 2000,
                        preloadFileSize = 50000,
                        library = {
                            [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                            [vim.fn.stdpath 'data' .. '/lazy'] = true,
                        },
                    },
                },
            },
        })
    end

    return handlers
end

return M
