require('jot').setup({
    search_dir = "~/Documents/org/",
    search_depth = 2,
    hide_search_dir = true,
    post_open_hook = function() vim.cmd("normal zx") end,
})
