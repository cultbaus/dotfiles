local config = require 'user.plugin.config.conform'

return {
    { 'stevearc/conform.nvim', event = 'BufWritePre', config = config.conform },
}
