-- lua/plugins/specs/telescope.lua
return function(use)
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = { 'nvim-lua/plenary.nvim' },
  }
end
