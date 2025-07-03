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
	use{
		"kdheepak/lazygit.nvim",
		requires = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	}
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require('nvim-ts-autotag').setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false -- Auto close on trailing </
				},
				per_filetype = {
                    ["html"] = {
                        enable_close = false
                    }
                }
            })
        end
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    })

    use({
        "Isrothy/neominimap.nvim",
        -- tag = "v3.x.x", -- same as `version` in lazy.nvim
        config = function()
            -- Recommended settings when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36

            -- Plugin configuration
            vim.g.neominimap = {
                auto_enable = true,
            }

            -- Keybindings (you can move this to a keymaps file if you prefer)
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true, desc = "" }

        end,
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'auto',
                    icons_enabled = true,
                }
            }
        end
    }



	-- Some django specific plug ins
	use 'neovim/nvim-lspconfig'
end)
