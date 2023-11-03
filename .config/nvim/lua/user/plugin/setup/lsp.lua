local config = require 'user.plugin.config.lsp'

return {
    { 'neovim/nvim-lspconfig', config = config.lsp_config, keys = config.lsp_keys },
}
