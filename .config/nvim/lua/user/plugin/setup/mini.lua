local config = require 'user.plugin.config.mini'

return {
    { 'echasnovski/mini.ai',      event = 'VeryLazy', config = config.ai },
    { 'echasnovski/mini.base16',  lazy = false,       config = config.base16 },
    { 'echasnovski/mini.comment', event = 'VeryLazy', config = config.comment },
    { 'echasnovski/mini.pick',    event = 'VeryLazy', config = config.pick,   keys = config.pick_keys },
}
