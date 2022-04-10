local config = require('user.utils').config

local ok, packer = pcall(require, 'packer')
if not ok then
    return
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'windwp/nvim-autopairs'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-lua/lsp-status.nvim'
    use 'numToStr/Comment.nvim'
    use 'williamboman/nvim-lsp-installer'
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
        },
    }
    packer.install()
end)

config 'nvim-cmp'
config 'nvim-autopairs'
config 'nvim-treesitter'
config 'nvim-telescope'
config 'nvim-lsp-installer'
config 'null_ls'
config 'comment'
config 'neogit'
