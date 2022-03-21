local ok, builtins = pcall(require, 'telescope.builtin')
if not ok then
    return
end

local utils = require 'user.utils'

local M = {}

M.find_files_m = function()
    if utils.is_git_dir == 0 then
        builtins.git_files {}
    else
        builtins.find_files { previewer = false }
    end
end

M.live_grep = function()
    builtins.live_grep {}
end

return M
