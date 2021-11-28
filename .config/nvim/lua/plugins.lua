vim.cmd [[packadd packer.nvim]]
 
return require('packer').startup(function()
    use 'farmergreg/vim-lastplace'
    use 'tpope/vim-surround'
    -- use 'jiangmiao/auto-pairs'
    use 'ap/vim-css-color'
    use 'sholland1/vim-wal'
    use 'dylanaraps/wal'
	use 'tpope/vim-commentary'
	use 'junegunn/fzf.vim'
	use 'preservim/nerdtree'
	use 'nvim-treesitter/nvim-treesitter'
	use {'nvim-orgmode/orgmode', config = function()
	        require('orgmode').setup{}
	end
	}
	use {
	  	'nvim-lualine/lualine.nvim',
	  	requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use {
		'rose-pine/neovim',
		as = 'rose-pine',
	    config = function()
			vim.g.rose_pine_variant = 'moon'
	        vim.cmd('colorscheme rose-pine')
	    end
	}
	-- use { 
	-- 	'TimUntersberger/neogit', 
	-- 	requires = 'nvim-lua/plenary.nvim' 
	-- }
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'SirVer/ultisnips'
	use 'lervag/vimtex'
	-- use "steelsojka/pears.nvim"
	use 'windwp/nvim-autopairs'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'quangnguyen30192/cmp-nvim-ultisnips'
	use {
		'goolord/alpha-nvim',
	  	requires = {'kyazdani42/nvim-web-devicons'},
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.opts)
		end
	}
end)
