vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use "terrortylor/nvim-comment"
  use 'tibabit/vim-templates'
  use 'neovim/nvim-lspconfig'

  -- Load plugin spec files
  require('plugins.specs.lualine')(use)
  require('plugins.specs.telescope')(use)
  require('plugins.specs.lsp-zero')(use)
  require('plugins.specs.nvim-tree')(use)
  require('plugins.specs.vim-matchup')(use)
  require('plugins.specs.nvim-autopair')(use)
  require('plugins.specs.nvim-treesitter')(use)
  require('plugins.specs.lazygit')(use)
  require('plugins.specs.nvim-ts-autotag')(use)
  require('plugins.specs.gitsigns')(use)
  require('plugins.specs.neominimap')(use)
  require('plugins.specs.which-key')(use)
  require('plugins.specs.nvim-web-devicons')(use)

  -- add more plugin specs as needed
end)
