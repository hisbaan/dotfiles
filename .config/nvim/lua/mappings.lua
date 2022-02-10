local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local expr_options = { noremap = true, expr = true, silent = true }

-- set leader key
map('n', '<Space>', '<Nop>' , opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- center search results
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- deal with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- better indenting
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- paste over currently selected text without yanking it
map("v", "p", "\"_dP", opts)

-- Tab switch buffer
map("n", "<S-l>", "<Cmd>bnext<CR>", opts)
map("n", "<S-h>", "<Cmd>bprevious<CR>", opts)
map("t", "<C-S-l>", "<Cmd>bnext<CR>", opts)
map("t", "<C-S-h>", "<Cmd>bprevious<CR>", opts)

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Resizing panes
map("n", "<C-Left>", ":vertical resize +1<CR>", opts)
map("n", "<C-Right>", ":vertical resize -1<CR>", opts)
map("n", "<C-Up>", ":resize -1<CR>", opts)
map("n", "<C-Down>", ":resize +1<CR>", opts)

-- Autocorrect spelling from previous error
map("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Ctrl + backspace
vim.cmd([[
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
]])

-- NvimTree
map('n', '<Leader>f', '<Cmd>NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<Leader><Space>', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>.', "<Cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", opts)
map('n', '<Leader>ca', '<Cmd>Telescope lsp_code_actions<CR>', opts)

-- Terminal
map('n', '<Leader>tt', '<Cmd>terminal<CR>A', opts)
map('n', '<Leader>te', '<Cmd>!alacritty --working-directory=$(pwd) & disown<CR><CR>', opts)

-- Neogit
map('n', '<Leader>gg', '<Cmd>Neogit<CR>', opts)
