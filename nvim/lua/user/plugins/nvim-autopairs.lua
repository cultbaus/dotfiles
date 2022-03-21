local pair_ok, autopairs = pcall(require, 'nvim-autopairs')
if not pair_ok then
    return
end

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then
    return
end

autopairs.setup {}
cmp.setup {
    map_complete = false,
    map_cr = true,
    auto_select = true,
}
