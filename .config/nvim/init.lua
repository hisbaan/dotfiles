-- Packer
require('plugins') -- lua/plugins.lua

-- Vim settings
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
vim.g.tex_flavor = "latex"

-- Color scheme
vim.g.rose_pine_variant = 'moon'
vim.cmd('colorscheme rose-pine')

-- Plugin configs
require('lualine-config') 		-- lua/lualine-config.lua
require('treesitter-config') 	-- lua/treesitter-config.lua
require('nerdtree-config') 		-- lua/nerdtree-config.lua
-- require('neogit-config')		-- lua/neogit-config.lua
require('ultisnips-config')		-- lua/ultisnips-config.lua
require('autopairs-config')		-- lua/autopairs-config
require('orgmode-config')		-- lua/orgmode-config
require('telescope-config')		-- lua/telescope-config
require('vimtex-config')		-- lua/vimtex-config

-- neoscroll for smooth scrolling
