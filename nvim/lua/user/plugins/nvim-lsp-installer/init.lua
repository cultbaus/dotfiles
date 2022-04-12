local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not ok then
    return
end

local path = (...):gsub('%.init%', '')
local servers = path .. '.servers'
local config = require(path .. '.config')

local function should_install()
    local installed = {
        'cmake',
        'bashls',
    }
    local fn = vim.fn
    if fn.executable 'node' then
        table.insert(installed, 'tsserver')
    end
    if fn.executable 'go' then
        table.insert(installed, 'gopls')
    end
    if fn.executable 'cargo' then
        table.insert(installed, 'rust_analyzer')
    end
    if fn.executable 'luajit' then
        table.insert(installed, 'sumneko_lua')
    end
    return installed
end

for _, name in pairs(should_install()) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        server:install()
    end
end

local server_opts = {}

for _, name in pairs(should_install()) do
    local server_ok, module = pcall(require, servers .. '.' .. name)
    if server_ok then
        server_opts[name] = function(opts)
            opts = vim.tbl_deep_extend('force', module.setup(config), opts)
            return opts
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server_opts[server.name] then
        opts = server_opts[server.name](opts)
    end
    server:setup(opts)
end)
