vim.g.NERDTreeChDirMode = 2
vim.g.NERDTreeMinimalUI = 0
vim.g.NERDTreeAutoDeleteBuffer = 1

vim.api.nvim_set_keymap('n', '<Leader>.', ':NERDTreeToggle<CR>', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><Space>', ':NERDTreeFind<CR>', {expr = true, noremap = true})
