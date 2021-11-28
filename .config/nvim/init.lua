-- Packer
require('plugins') -- lua/plugins.lua

-- Vim settings
vim.o.linebreak = true
vim.o.hidden = true
vim.o.history = 5000
vim.o.shiftwidth = vim.o.tabstop
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.o.encoding = "utf-8"
vim.g.tex_flavor = "latex"

-- Tabs & Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

if vim.fn.executable("rg") then
	vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

-- Appearance
vim.g.rose_pine_variant = 'moon'
vim.cmd('colorscheme rose-pine')
vim.opt.background = "dark"
vim.opt.cursorline = true
vim.wo.rnu = true
vim.wo.number = true
vim.opt.scrolloff = 1
vim.opt.sidescrolloff = 5
vim.opt.showmode = false
vim.opt.termguicolors = true

-- Mappings
-- Ctrl + backspace
vim.cmd([[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]])

-- Plugin configs
require('lualine-config') 		-- lua/lualine-config.lua
require('treesitter-config') 	-- lua/treesitter-config.lua
require('nerdtree-config') 		-- lua/nerdtree-config.lua
-- require('neogit-config')		-- lua/neogit-config.lua
require('ultisnips-config')		-- lua/ultisnips-config.lua
require('autopairs-config')		-- lua/autopairs-config.lua
require('orgmode-config')		-- lua/orgmode-config.lua
require('telescope-config')		-- lua/telescope-config.lua
require('vimtex-config')		-- lua/vimtex-config.lua
require('lsp-config')			-- lua/lsp-config.lua

-- neoscroll for smooth scrolling
