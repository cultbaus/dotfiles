local config = require 'user.plugin.config.nvim-autopairs'

return {
    { 'windwp/nvim-autopairs', event = 'InsertEnter', config = config.autopairs },
}
