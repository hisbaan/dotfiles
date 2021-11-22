require('plugins')

-- vim.o.nocompatible = true
vim.o.linebreak = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hidden = true
vim.o.history = 5000
vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.wo.rnu = true
vim.wo.number = true
vim.o.mouse = "a"
vim.o.encoding = "utf-8"

vim.g.rose_pine_variant = 'moon'
vim.cmd('colorscheme rose-pine')
require('lualine-config')
require('treesitter-config')
