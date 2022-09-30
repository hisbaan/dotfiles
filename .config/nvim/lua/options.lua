local o = vim.opt
local wo = vim.wo
local fn = vim.fn
local g = vim.g

o.linebreak = true
o.hidden = true
o.history = 5000
o.shiftwidth = vim.o.tabstop
o.clipboard = "unnamedplus" -- let nvim use system clipboard
o.mouse = "a"
o.encoding = "utf-8"
g.tex_flavor = "latex"
o.undofile = true
o.timeoutlen = 400 -- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeout = true
o.ttimeoutlen = 0 -- Time in milliseconds to wait for a key code sequence to complete
o.conceallevel = 0 -- so that ` is visible in markdown files
o.concealcursor = "nc"
if vim.fn.executable("rg") then
	o.grepprg = "rg --vimgrep --no-heading --smart-case --"
end
o.completeopt = {"menu", "menuone", "noselect", "noinsert"} -- A comma separated list of options for Insert mode completion
o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildignore = [[
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
o.tabstop = 4
o.shiftwidth = 4
vim.cmd([[set nojoinspaces]])
-- o.nojoinspaces = true
o.expandtab = true -- convert tabs to spaces
o.smartindent = true -- make indenting smarter again
o.breakindent = true -- indent wrapped lines

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- Appearance
o.background = "dark"
o.cursorline = true
wo.rnu = true
wo.number = true
o.scrolloff = 3
o.sidescrolloff = 5
o.termguicolors = true
o.cmdheight = 1 -- space for displaying messages/commands
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.showtabline = 2 -- always show tabs
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.hlsearch = true -- highlight all matches on previous search pattern
o.foldenable = false -- disable folding; enable with zi
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣"
o.lazyredraw = true -- do not redraw screen while running macros
