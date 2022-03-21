local ok, telescope = pcall(require, 'telescope')
if not ok then
    return
end

local actions = require 'telescope.actions' -- submodule doesn't require protected call

telescope.setup {
    defaults = {
        layout_strategy = 'horizontal',
        use_less = false,
        mappings = {
            i = {
                ['<Esc>'] = actions.close,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
            },
        },
    },
}
