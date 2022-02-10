local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local cmp = prequire("cmp")

local term = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if luasnip and luasnip.expand_or_jumpable() then
        return term("<Plug>luasnip-expand-or-jump")
    elseif cmp and cmp.visible() then
        cmp.select_next_item()
    elseif check_back_space() then
        return term "<Tab>"
    else
        cmp.complete()
    end
    return ""
end
_G.s_tab_complete = function()
    if luasnip and luasnip.jumpable(-1) then
        return term("<Plug>luasnip-jump-prev")
    elseif cmp and cmp.visible() then
        cmp.select_prev_item()
    else
        return term "<S-Tab>"
    end
    return ""
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

--------------
-- Snippets --
--------------

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

s(
    {
        trig = "in",
        name = "inline math mode",
    },
    {
        t("\\(") ,
        i(1),
        t("\\)"),
        i(0),
    }
)
