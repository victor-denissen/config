local mode_map = {
  ['n'] = '🅝',
  ['i'] = '🅘',
  ['v'] = '🅥',
  ['V'] = '🅥',
  ['c'] = '🅒',
  ['t'] = '🅣',
}

require('lualine').setup {
  options = {
    theme = 'onedark',
    icons_enabled = true,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'NvimTree', 'packer' },
      winbar = {},
    },
  },

  sections = {
    lualine_a = {
      function()
        return mode_map[vim.fn.mode()] or vim.fn.mode()
      end,
    },
    lualine_b = {
      { 'branch', icon = '' },
      'diff',
    },
    lualine_c = {
      { 'filename', path = 1 }, -- show relative path
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      },
    },
    lualine_x = {
      {
        function()
          local ok, msg = pcall(vim.api.nvim_buf_get_var, 0, 'gitsigns_blame_line')
          return ok and (' ' .. msg:gsub('%s+%(%d+%s+.*%)', '')) or ''
        end,
        cond = function()
          return vim.b.gitsigns_head ~= nil
        end,
      },
      'encoding',
      'fileformat',
      'filetype',
    },
    lualine_y = {
      { 'progress' },
    },
    lualine_z = {
      'location',
    },
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'fugitive', 'nvim-tree', 'quickfix' },
}
