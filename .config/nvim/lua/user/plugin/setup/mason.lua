local config = require 'user.plugin.config.mason'

return {
    { 'williamboman/mason.nvim', config = config.core },
    { 'williamboman/mason-lspconfig.nvim', config = config.lsp },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', event = 'VeryLazy', config = config.installer },
}
