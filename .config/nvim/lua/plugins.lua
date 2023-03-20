local function get_config(name)
    return function() require(string.format('config/%s', name)) end
end

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'nvim-lua/plenary.nvim', },
    { 'nvim-lua/popup.nvim' },
    {
        'kylechui/nvim-surround',
        config = get_config('nvim-surround')
    },
    {
        'nguyenvukhang/nvim-toggler',
        config = get_config('nvim-toggler')
    },
    {
        'zakharykaplan/nvim-retrail',
        config = get_config('nvim-retrail')
    },
    {
        'numToStr/Comment.nvim',
        config = get_config('comment')
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring' },
    {
        'L3MON4D3/LuaSnip',
        config = get_config('luasnip')
    },
    { 'rafamadriz/friendly-snippets' },
    { 'honza/vim-snippets' },
    {
        'windwp/nvim-autopairs',
        config = get_config('autopairs')
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = get_config('treesitter')
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        config = get_config('treesitter-context')
    },
    {
        'ethanholz/nvim-lastplace',
        config = get_config('nvim-lastplace')
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = get_config('nvim-colorizer')
    },
    {
        'lervag/vimtex',
        ft = { 'tex' },
        config = get_config('vimtex'),
    },
    {
        'akinsho/bufferline.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = get_config('bufferline')
    },
    {
        'TimUntersberger/neogit',
        dependencies = 'nvim-lua/plenary.nvim',
        config = get_config('neogit')
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = get_config('nvim-tree')
    },
    {
        'nvim-orgmode/orgmode',
        ft = { 'org' },
        config = get_config('orgmode')
    },
    {
        'akinsho/org-bullets.nvim',
        ft = { 'org' },
        config = get_config('org-bullets')
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
        config = get_config('lualine'),
        enabled = false,
    },
	{
		'feline-nvim/feline.nvim',
		config = get_config('feline'),
        enabled = true,
	},
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        config = get_config('catppuccin'),
        priority = 1000,
        enabled = true,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = get_config('rose-pine'),
        priority = 1000,
        enabled = false,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = get_config('telescope')
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = { 'markdown' },
        config = get_config('markdown-preview')
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    },
    {
        'ahmedkhalf/project.nvim',
        config = get_config('project'),
    },
    { 'folke/neodev.nvim' },
    { 'barreiroleo/ltex-extra.nvim' },
    {
        'neovim/nvim-lspconfig',
        config = get_config('lsp')
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
        },
        config = get_config('cmp')
    },
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = get_config('mason')
    },
    {
        url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
        config = get_config('lsp-lines'),
    },
    { 'mfussenegger/nvim-dap', config = get_config('dap') },
    {
        'mfussenegger/nvim-dap-python',
        ft = "python",
        dependencies = 'mfussenegger/nvim-dap',
        config = get_config('dap-python'),
    },
    { 'mfussenegger/nvim-jdtls', enabled = false },
    { 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls') },
    {
        'rmagatti/auto-session',
        config = get_config('auto-session'),
    },
    {
        'goolord/alpha-nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = get_config('alpha-nvim'),
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = get_config('gitsigns')
    },
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = get_config('todo-comments'),
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = get_config('nvim-ufo')
    },
    {
        'akinsho/toggleterm.nvim',
        config = get_config('toggleterm')
    },
    {
        'folke/which-key.nvim',
        config = get_config('which-key')
    },
    {
        'hisbaan/jot.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = get_config('jot'),
    },
    {
        'smjonas/live-command.nvim',
        config = get_config('live-command')
    },
    {
        'gaoDean/autolist.nvim',
        ft = {
            'markdown',
            'text',
            'org',
        },
        config = get_config('autolist'),
        enabled = false
    },
    {
        'danymat/neogen',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true,
    },
    {
        'nmac427/guess-indent.nvim',
        config = get_config('guess-indent')
    },
    {
        "samjwill/nvim-unception",
        config = get_config("unception")
    },
    -- {
    --     "zbirenbaum/copilot.lua",
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = get_config('copilot')
    -- },
}

local opts = {
    plugins = {
        install = {
            colorscheme = { "catppuccin-mocha" }
        }
    },
    ui = {
        border = "rounded"
    }
}
require('lazy').setup(plugins, opts)
