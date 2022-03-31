-- Completion
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.shortmess = 'I'

-- Search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Indents
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- Line options
vim.o.showmatch = true

-- Lazy
vim.o.lazyredraw = true

-- Status line
vim.o.ruler = true
vim.o.showmode = false
vim.o.laststatus = 2
vim.o.statusline = [[%!luaeval("require'user.core.statusline'.render()")]]

-- Better display
vim.wo.signcolumn = 'number'
vim.o.cmdheight = 2
vim.o.hidden = true
vim.o.pumheight = 10
vim.o.splitbelow = true

-- File types
vim.o.encoding = 'utf8'
vim.o.ffs = 'unix,dos,mac'

-- Hover update debouncer
vim.o.updatetime = 300

-- File changes
vim.o.autowrite = true
vim.o.autoread = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Pattern matching
vim.o.maxmempattern = 20000
vim.o.magic = true

-- List characters
vim.wo.list = true
vim.o.listchars = string.format 'tab:» ,extends:›,precedes:‹,nbsp:·,trail:·'
vim.o.fillchars = vim.o.fillchars .. string.format 'vert: ,eob: '

-- System clipboard
vim.o.clipboard = vim.o.clipboard .. 'unnamedplus'

-- Misc
vim.wo.wrap = true
vim.o.spell = false
vim.wo.number = true
