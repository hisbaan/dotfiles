local map = vim.api.nvim_set_keymap
local default_options = { noremap = true, silent = true }
local expr_options = { noremap = true, expr = true, silent = true }

-- set leader key
map('n', '<Space>', '<NOP>' , default_options)
vim.g.mapleader = " "

-- center search results
map("n", "n", "nzz", default_options)
map("n", "N", "Nzz", default_options)

-- deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", default_options)
map("v", ">", ">gv", default_options)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", default_options)

-- Tab switch buffer
map("n", "<TAB>", ":bnext<CR>", default_options)
map("n", "<S-TAB>", ":bprevious<CR>", default_options)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_options)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", default_options)
map("n", "<Right>", ":vertical resize -1<CR>", default_options)
map("n", "<Up>", ":resize -1<CR>", default_options)
map("n", "<Down>", ":resize +1<CR>", default_options)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", default_options)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", default_options)
map("x", "J", ":move '>+1<CR>gv-gv", default_options)

-- Ctrl + backspace
vim.cmd([[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]])

-- NvimTree
map('n', '<Leader>f', '<Cmd>NvimTreeToggle<CR>', default_options )

-- Telescope
map('n', '<Leader><Space>', '<Cmd>Telescope find_files<CR>', default_options)
map('n', '<Leader>.', "<Cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", default_options)

-- Terminal
map('n', '<Leader>tt', '<Cmd>terminal<CR>A', default_options)
