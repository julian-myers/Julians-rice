vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' ' 

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = false
vim.opt.autoread = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true


vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.shiftround = true
vim.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

