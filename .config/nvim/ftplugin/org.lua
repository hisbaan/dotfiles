local utils = require('map_utils')
local lua_fn = utils.lua_fn

vim.opt.tabstop = 2
vim.opt_local.shiftwidth = 2
vim.opt_local.conceallevel = 2
vim.opt_local.concealcursor = 'nc'

-- Add <C-CR> insert mode binding to create new item
vim.api.nvim_set_keymap('i', '<C-CR>', '<C-o><C-CR>', { noremap = false, silent = true })

-- Toggle either todo item or checkbox item with <CR> in normal mode
local function toggleTodoOrCheckBox()
    local line = vim.api.nvim_get_current_line()

    if line:match("^(%*+ .)") then
        vim.api.nvim_input('cit')
    elseif line:match('^(%s*%- %[.%])') then
        vim.api.nvim_input('<C-Space>')
    end
end
vim.api.nvim_set_keymap('n', '<CR>', lua_fn(function() toggleTodoOrCheckBox() end), { noremap = false, silent = true })

-- fix <C-t> and <C-d> mappings on odd numbered headings
vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>m1^i<Space><Space><Esc>`1lla', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>m1^hh_x_x`1a', { noremap = false, silent = true })
