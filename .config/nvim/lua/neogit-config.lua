local neogit = require('neogit')
neogit.setup{}
-- vim.api.nvim_set_keymap('n', '<Leader>gg', 'neogit.open({ kind = "tab" })', {expr = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>gg', 'g:Neogit', {expr = true, noremap = true})
