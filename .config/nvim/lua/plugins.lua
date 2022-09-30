-- vim.cmd [[packadd packer.nvim]]

local function get_config(name)
    return string.format('require(\'config/%s\')', name)
end

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

local packer = require('packer')
packer.init {
    enable = true,
    treshold = 0,
}
local use = packer.use
packer.reset()

packer.startup({ function()
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'kylechui/nvim-surround', config = get_config('nvim-surround') }
    use { 'nguyenvukhang/nvim-toggler', config = get_config('nvim-toggler') }
    use { 'zakharykaplan/nvim-retrail', config = get_config('nvim-retrail') }
    use { 'numToStr/Comment.nvim', config = get_config('comment') }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'L3MON4D3/LuaSnip', config = get_config('luasnip') }
    use { 'rafamadriz/friendly-snippets' }
    use { 'honza/vim-snippets' }
    use { 'windwp/nvim-autopairs', config = get_config('autopairs') }
    use { 'nvim-treesitter/nvim-treesitter', config = get_config('treesitter') }
    use { 'nvim-treesitter/nvim-treesitter-context', config = get_config('treesitter-context') }
    use { 'ethanholz/nvim-lastplace', config = get_config('nvim-lastplace') }
    use { 'NvChad/nvim-colorizer.lua', config = get_config('nvim-colorizer') }
    use { 'lervag/vimtex', config = get_config('vimtex'), }
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
        ft = { 'markdown' },
        config = get_config('markdown-preview')
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = get_config('nvim-tree')
    }
    use {
        'gaoDean/autolist.nvim',
        config = get_config('autolist')
    }
    use {
        'nvim-orgmode/orgmode',
        ft = { 'org' },
        config = get_config('orgmode')
    }
    use {
        'akinsho/org-bullets.nvim',
        ft = { 'org' },
        config = get_config('org-bullets')
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
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
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'ahmedkhalf/project.nvim', config = get_config('project') }
    use { 'folke/lua-dev.nvim' }
    use { 'barreiroleo/ltex-extra.nvim' }
    use { 'neovim/nvim-lspconfig', config = get_config('lsp') }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
        },
        config = get_config('cmp')
    }
    use {
        'williamboman/mason.nvim',
        requires = { 'williamboman/mason-lspconfig.nvim' },
        config = get_config('mason')
    }
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = get_config("lsp-lines"),
    })
    use { 'mfussenegger/nvim-dap', config = get_config('dap') }
    use { 'mfussenegger/nvim-jdtls' }
    use { 'jose-elias-alvarez/null-ls.nvim', config = get_config('null-ls') }
    use {
        'rmagatti/auto-session',
        config = get_config('auto-session'),
    }
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = get_config('alpha-nvim')
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = get_config('gitsigns')
    }
    use {
        'folke/todo-comments.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = get_config('todo-comments'),
    }
    use {
        'kevinhwang91/nvim-ufo',
        requires = 'kevinhwang91/promise-async',
        config = get_config('nvim-ufo')
    }
    use { 'akinsho/toggleterm.nvim', config = get_config('toggleterm') }
    use { 'folke/which-key.nvim', config = get_config('which-key') }

    use {
        'hisbaan/jot.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = get_config('jot'),
    }

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
