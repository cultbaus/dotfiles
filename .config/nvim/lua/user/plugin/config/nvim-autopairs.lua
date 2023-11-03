local M = {}

M.autopairs = function()
    local cmp = require 'cmp'
    local pairs = require 'nvim-autopairs'
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'

    pairs.setup {}

    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
