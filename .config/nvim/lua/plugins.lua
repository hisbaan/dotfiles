vim.cmd [[packadd packer.nvim]]

local function get_config(name)
    return string.format('require(\'config/%s\')', name)
end

local packer = require("packer")
packer.init {
    enable = true,
    treshold = 0,
}
local use = packer.use
packer.reset()

packer.startup({function()
    use { 'nvim-lua/plenary.nvim' }
    use { 'nvim-lua/popup.nvim' }
    use { 'tpope/vim-surround' }
    use { 'numToStr/Comment.nvim', config = get_config('comment')}
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'SirVer/ultisnips', config = get_config('ultisnips') }
    -- use { 'L3MON4D3/LuaSnip', config = get_config('luasnip') }
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
        { 'quangnguyen30192/cmp-nvim-ultisnips' }
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
    -- use {
    --     "brymer-meneses/grammar-guard.nvim",
    --     requires = {
    --         "neovim/nvim-lspconfig",
    --         "williamboman/nvim-lsp-installer"
    --     },
    --     config = get_config('grammar-guard')
    -- }
    -- use {
    --     'abecodes/tabout.nvim',
    --     config = function()
    --         require('tabout').setup {
    --             tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    --             backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    --             act_as_tab = true, -- shift content if tab out is not possible
    --             act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    --             enable_backwards = true, -- well ...
    --             completion = true, -- if the tabkey is used in a completion pum
    --             tabouts = {
    --             {open = "'", close = "'"},
    --             {open = '"', close = '"'},
    --             {open = '`', close = '`'},
    --             {open = '(', close = ')'},
    --             {open = '[', close = ']'},
    --             {open = '{', close = '}'},
    --             {open = '\\(', close = '\\)'},
    --             {open = '\\[', close = '\\]'},
    --             },
    --             ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    --             exclude = {} -- tabout will ignore these filetypes
    --         }
    --
    --         -- ["<Tab>"] = function(fallback)
    --         --     if vim.fn("UltiSnips#CanExpandSnippet") or vim.fn("UltiSnips#CanJumpForwards") then
    --         --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>()"))
    --         --     end
    --         --
    --         -- ["<Tab>"] = function(fallback)
    --         --     if cmp.visible() then
    --         --         -- cmp.select_next_item()
    --         --         cmp.confirm(
    --         --         {
    --         --                 behavior = cmp.ConfirmBehavior.Insert,
    --         --                 select = true
    --         --             }
    --         --         )
    --         --     elseif vim.fn["vsnip#available"](1) ~= 0 then
    --         --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
    --         --     else
    --         --         fallback()
    --         --     end
    --         -- end,
    --         -- ["<S-Tab>"] = function(fallback)
    --         --     if cmp.visible() then
    --         --         cmp.select_prev_item()
    --         --     elseif vim.fn["vsnip#available"](1) ~= 0 then
    --         --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
    --         --     else
    --         --         fallback()
    --         --     end
    --         -- end,
    --         end,
    --         wants = {'nvim-treesitter'}, -- or require if not used so far
    --         -- after = {'ultisnips'} -- if a completion plugin is using tabs load it before
    -- }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = get_config("todo-comments"),
    }
end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
}
)
