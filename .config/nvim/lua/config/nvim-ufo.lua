-- vim.wo.foldcolumn = '1'
vim.wo.foldlevel = 99 -- feel free to decrease the value
vim.wo.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local filetypes = { org = '' }

require("ufo").setup({
    open_fold_h1_timeout = 0,
    -- fold_virt_text_handler = handler,
    provider_selector = function(_, ft)
        return filetypes[ft] or { 'treesitter', 'indent' }
    end,
})
