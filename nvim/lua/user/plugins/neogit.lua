local ok, neogit = pcall(require, 'neogit')

if not ok then
    return
end

if type(neogit) == 'boolean' then
    return
end

neogit.setup {
    disable_commit_confirmation = true,
    disable_hint = true,
    disable_signs = true,
}
