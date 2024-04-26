-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional
		},
	}
	use "terrortylor/nvim-comment"


	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'andymass/vim-matchup',
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end
	}
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup {}
		end
	}
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'tibabit/vim-templates'
	-- nvim v0.7.2
	use({
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})
	-- nvim v0.7.2
	-- use {
	-- 	'dense-analysis/ale',
	-- 	config = function()
	-- 		-- Configuration goes here.
	-- 		local g = vim.g
	--
	-- 		g.ale_ruby_rubocop_auto_correct_all = 1
	--
	-- 		g.ale_linters = {
	-- 			ruby = {'rubocop', 'ruby'},
	-- 			lua = {'lua_language_server'},
	-- 			cpp = {'clang'}
	-- 		}
	--
	-- 		-- Set specific ALE commands for Lua and C++
	-- 		g.ale_cpp_clang_executable = 'clang' -- Or specify the path to your clang executable
	-- 		g.ale_cpp_clang_options = '-std=c++98 -Wall -Werror -Wextra' -- Or any other compiler flags you want to use for C++
	--
	-- 	end
	-- }
end)
