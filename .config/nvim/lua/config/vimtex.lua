vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_toc_config = {
    mode = 1,
    fold_enable = 0,
    hide_line_numbers = 1,
    resize = 0,
    refresh_always = 1,
    show_help = 0,
    show_numbers = 1,
    split_pos = 'leftabove',
    split_width = 30,
    tocdeth = 3,
    indent_levels = 1,
    todo_sorted = 1,
}
-- vim.g.vimtex_latexmk_options = "-shell-escape -verbose -file-line-error -synctex=1 -interaction=nonstopmode"
-- vim.g.vimtex_compiler_latexmk = "lualatex"
-- vim.cmd([[ syntax enable ]])
-- vim.g.vimtex_compiler_latexmk_engines = {
-- 	_        = '-lualatex',
-- 	pdflatex = '-pdf',
-- 	dvipdfex = '-pdfdvi',
-- 	lualatex = '-lualatex',
-- 	xelatex  = '-xelatex'
-- }
