local lua_fn = require('map_utils').lua_fn

vim.opt.tabstop = 2
vim.opt_local.shiftwidth = 2

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

-- local function indent()
--     local pos = vim.api.nvim_win_get_cursor(0)[2]
--     local line = vim.api.nvim_get_current_line()
--     local nline = '  ' .. line
--     vim.api.nvim_set_current_line(nline)
-- end
--
-- local function dedent()
--     -- local pos = vim.api.nvim_win_get_cursor(0)[2]
--     local line = vim.api.nvim_get_current_line()
--     local nline = line:gsub('  ', '', 1)
--     vim.api.nvim_set_current_line(nline)
-- end

vim.api.nvim_set_keymap('n', '<CR>', lua_fn(function() toggleTodoOrCheckBox() end), { noremap = false, silent = true })

vim.api.nvim_set_keymap('i', '<C-t>', '<Esc>m1^i<Space><Space><Esc>`1lla', { noremap = false, silent = true })
vim.api.nvim_set_keymap('i', '<C-d>', '<Esc>m1^hh"_x"_x`1a', { noremap = false, silent = true })


-- vim.api.nvim_set_keymap('i', '<C-t>', lua_fn(function() indent() end), { noremap = false, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-d>', lua_fun(function() dedent() end), { noremap = false, silent = true })

if vim.g.colors_name == 'catppuccin' then
    local cp = require("catppuccin.palettes").get_palette()
    vim.api.nvim_set_hl(0, 'OrgBulletsDash', { fg = cp.flamingo, link = nil })
    vim.api.nvim_set_hl(0, 'OrgBulletsPlus', { fg = cp.flamingo, link = nil })
    vim.api.nvim_set_hl(0, 'OrgBulletsStar', { fg = cp.flamingo, link = nil })
end
