local opt = vim.opt
local wo = vim.wo
local g = vim.g

opt.linebreak = true
opt.hidden = true
opt.history = 5000
opt.shiftwidth = vim.o.tabstop
opt.clipboard = "unnamedplus" -- let nvim use system clipboard
opt.mouse = "a"
opt.encoding = "utf-8"
g.tex_flavor = "latex"
opt.undofile = true
opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.ttimeout = true
opt.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
opt.conceallevel = 0 -- so that ` is visible in markdown files
opt.concealcursor = "nc"
opt.virtualedit = "all"
if vim.fn.executable("rg") then
	opt.grepprg = "rg --vimgrep --no-heading --smart-case --"
end
opt.completeopt = {"menu", "menuone", "noselect", "noinsert"} -- A comma separated list of options for Insert mode completion
opt.wildignorecase = true -- When set case is ignored when completing file names and directories
opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**/target/**,**.terraform/**"
]]

-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
vim.cmd([[set nojoinspaces]])
-- o.nojoinspaces = true
opt.expandtab = true -- convert tabs to spaces
opt.smartindent = true -- make indenting smarter again
opt.breakindent = true -- indent wrapped lines

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Appearance
-- opt.background = "dark"
opt.cursorline = true
wo.rnu = true
wo.number = true
opt.scrolloff = 3
opt.sidescrolloff = 5
opt.termguicolors = true
opt.cmdheight = 1 -- space for displaying messages/commands
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.lazyredraw = true -- do not redraw screen while running macros
