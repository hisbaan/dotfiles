-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/hisbaan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hisbaan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hisbaan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hisbaan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hisbaan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "require('config/comment')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "require('config/luasnip')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "require('config/alpha-nvim')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["auto-session"] = {
    config = { "require('config/auto-session')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/auto-session",
    url = "https://github.com/rmagatti/auto-session"
  },
  ["autolist.nvim"] = {
    config = { "require('config/autolist')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/autolist.nvim",
    url = "https://github.com/gaoDean/autolist.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('config/bufferline')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config/gitsigns')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["jot.nvim"] = {
    config = { "require('config/jot')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/jot.nvim",
    url = "https://github.com/hisbaan/jot.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "require('config/lsp-lines')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["ltex-extra.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/ltex-extra.nvim",
    url = "https://github.com/barreiroleo/ltex-extra.nvim"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('config/lualine')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "require('config/markdown-preview')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "require('config/mason')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    config = { "require('config/neogit')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["null-ls.nvim"] = {
    config = { "require('config/null-ls')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config/autopairs')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "require('config/cmp')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config/nvim-colorizer')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "require('config/dap')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lastplace"] = {
    config = { "require('config/nvim-lastplace')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config/lsp')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-retrail"] = {
    config = { "require('config/nvim-retrail')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-retrail",
    url = "https://github.com/zakharykaplan/nvim-retrail"
  },
  ["nvim-surround"] = {
    config = { "require('config/nvim-surround')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-toggler"] = {
    config = { "require('config/nvim-toggler')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-toggler",
    url = "https://github.com/nguyenvukhang/nvim-toggler"
  },
  ["nvim-tree.lua"] = {
    config = { "require('config/nvim-tree')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('config/treesitter')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "require('config/treesitter-context')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ufo"] = {
    config = { "require('config/nvim-ufo')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["org-bullets.nvim"] = {
    config = { "require('config/org-bullets')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/opt/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    config = { "require('config/orgmode')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/opt/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "require('config/project')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["rose-pine"] = {
    config = { "require('config/rose-pine')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('config/telescope')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "require('config/todo-comments')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('config/toggleterm')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  vimtex = {
    config = { "require('config/vimtex')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  ["which-key.nvim"] = {
    config = { "require('config/which-key')" },
    loaded = true,
    path = "/home/hisbaan/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
require('config/project')
time([[Config for project.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
require('config/null-ls')
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('config/autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: rose-pine
time([[Config for rose-pine]], true)
require('config/rose-pine')
time([[Config for rose-pine]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('config/cmp')
time([[Config for nvim-cmp]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
require('config/lsp-lines')
time([[Config for lsp_lines.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config/telescope')
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require('config/dap')
time([[Config for nvim-dap]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
require('config/todo-comments')
time([[Config for todo-comments.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('config/toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config/lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('config/lsp')
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
require('config/nvim-surround')
time([[Config for nvim-surround]], false)
-- Config for: nvim-toggler
time([[Config for nvim-toggler]], true)
require('config/nvim-toggler')
time([[Config for nvim-toggler]], false)
-- Config for: nvim-retrail
time([[Config for nvim-retrail]], true)
require('config/nvim-retrail')
time([[Config for nvim-retrail]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('config/which-key')
time([[Config for which-key.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('config/nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config/treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
require('config/comment')
time([[Config for Comment.nvim]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('config/alpha-nvim')
time([[Config for alpha-nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
require('config/treesitter-context')
time([[Config for nvim-treesitter-context]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('config/luasnip')
time([[Config for LuaSnip]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
require('config/nvim-lastplace')
time([[Config for nvim-lastplace]], false)
-- Config for: autolist.nvim
time([[Config for autolist.nvim]], true)
require('config/autolist')
time([[Config for autolist.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
require('config/vimtex')
time([[Config for vimtex]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('config/bufferline')
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
require('config/nvim-ufo')
time([[Config for nvim-ufo]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('config/gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
require('config/mason')
time([[Config for mason.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
require('config/auto-session')
time([[Config for auto-session]], false)
-- Config for: neogit
time([[Config for neogit]], true)
require('config/neogit')
time([[Config for neogit]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('config/nvim-colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: jot.nvim
time([[Config for jot.nvim]], true)
require('config/jot')
time([[Config for jot.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode', 'org-bullets.nvim'}, { ft = "org" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
