vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.g.mapleader = " "

   
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = true

vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true
vim.opt.expandtab = true     -- converte TAB em espaços
vim.opt.shiftwidth = 4       -- recuo ao usar << ou >>
vim.opt.tabstop = 4          -- largura de um TAB visualmente
vim.opt.softtabstop = 4      -- quantos espaços o TAB insere
vim.opt.smartindent = true

vim.cmd("set expandtab")
