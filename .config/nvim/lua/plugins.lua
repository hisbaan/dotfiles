-- vim.cmd [[packadd packer.nvim]]

local function get_config(name)
    return string.format('require(\'config/%s\')', name)
end

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require("packer")
packer.init {
    enable = true,
    treshold = 0,
}
local use = packer.use
packer.reset()

packer.startup({function()
    use { "wbthomason/packer.nvim" }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'tpope/vim-surround' }
    use { 'numToStr/Comment.nvim', config = get_config('comment')}
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'L3MON4D3/LuaSnip', config = get_config('luasnip') }
    use { 'rafamadriz/friendly-snippets' }
    use { 'honza/vim-snippets' }
    use { 'windwp/nvim-autopairs', config = get_config('autopairs') }
    use { 'nvim-treesitter/nvim-treesitter', config = get_config('treesitter') }
    use { 'ethanholz/nvim-lastplace', config = get_config('nvim-lastplace') }
    use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }
    use {
        'lervag/vimtex',
        config = get_config('vimtex'),
    }
    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = get_config('bufferline')
    }
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = get_config('neogit')
    }
    use {
        'iamcco/markdown-preview.nvim',
        run = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = {'markdown'},
        config = get_config('markdown-preview')
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = get_config('nvim-tree')
    }
    use {
        'nvim-orgmode/orgmode',
        ft = {'org'},
        config = get_config('orgmode')
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = get_config('lualine')
    }
    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = get_config('rose-pine')
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = get_config('telescope')
    }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use {"ahmedkhalf/project.nvim", config = get_config("project") }
    use { 'neovim/nvim-lspconfig' }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'saadparwaiz1/cmp_luasnip' },
        },
        config = get_config('cmp')
    }
    use { 'williamboman/nvim-lsp-installer', config = get_config('lsp') }
    use {
        'goolord/alpha-nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = get_config('alpha-nvim')
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = get_config('gitsigns')
    }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = get_config("todo-comments"),
    }
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = get_config("nvim-ufo")
    }
    use { "akinsho/toggleterm.nvim", config = get_config("toggleterm") }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
}
)
