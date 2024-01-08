local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'


	use {
		'windwp/nvim-autopairs',
		config = function() require("nvim-autopairs").setup {} end
	}


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	use({
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
	})


	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}



	use 'rebelot/kanagawa.nvim'


	use 'lewis6991/gitsigns.nvim'

	use({
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'windwp/nvim-ts-autotag',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	})


	use({
		'neovim/nvim-lspconfig',
		requires = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'williamboman/nvim-lsp-installer',
			'aca/emmet-ls',
			'j-hui/fidget.nvim',
			'simrat39/rust-tools.nvim',
		},
	})

	use ({
		'mfussenegger/nvim-dap',
		requires = {
			'theHamsta/nvim-dap-virtual-text',
			'rcarriga/nvim-dap-ui',

			'williamboman/mason.nvim',
			'jay-babu/mason-nvim-dap.nvim',

			-- Add your own debuggers here
			'leoluz/nvim-dap-go',
		},
	})

	use({
		'mfussenegger/nvim-dap-python',
		ft = "python",
		requires = {
			'mfussenegger/nvim-dap',
			'rcarriga/nvim-dap-ui',
		},
		config = function()
			local path =  "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
		end
	}) 



	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	use 'jose-elias-alvarez/null-ls.nvim'

	use {"akinsho/toggleterm.nvim", tag = '*'}


	use {
		"olexsmir/gopher.nvim",
		requires = { -- dependencies
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	}


	if packer_bootstrap then
		require('packer').sync()
	end
end)
