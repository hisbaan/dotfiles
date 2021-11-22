vim.cmd [[packadd packer.nvim]]
 
return require('packer').startup(function()
    use 'farmergreg/vim-lastplace'
    use 'tpope/vim-surround'
    use 'jiangmiao/auto-pairs'
    use 'ap/vim-css-color'
    use 'sholland1/vim-wal'
    use 'dylanaraps/wal'
	use 'tpope/vim-commentary'
	use {
		'nvim-treesitter/nvim-treesitter'
		-- cmd = ':TSUpdate'
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
end)
