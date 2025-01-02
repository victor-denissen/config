require("vdenisse.packer")
require("vdenisse.remaps")
require('nvim_comment').setup()




-- All my colours shit
vim.o.termguicolors = true
vim.cmd('colorscheme default')

vim.api.nvim_set_hl(0, 'Normal', { fg = '#ffffff', bg = '#000000' }) -- White text on black background


-- vim.api.nvim_set_hl(0, 'Identifier', { fg = '#F06C00', italic = true }) -- Orange for variables
vim.api.nvim_set_hl(0, 'Type', { fg = '#00ff88', italic=true })		-- Green for types
vim.api.nvim_set_hl(0, 'Comment', { fg = '#625DF0', italic = true })	-- Dark blue for comments
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#00ff88', bg = '#1c1c1c' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#00ff88', bold = true })
vim.api.nvim_set_hl(0, 'Function', { fg = '#F06C00', bold = true })	-- Orange for functions
vim.api.nvim_set_hl(0, 'String', { fg = '#E00000', italic = true })	-- Red for strings
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#E00074', bold = true })	-- Pink for preprocs (#include)
vim.api.nvim_set_hl(0, 'Statement', { fg = '#DBE000', bold = true })	-- Yellow for statements (return)
vim.api.nvim_set_hl(0, 'Namespace', { fg = '#F06C00', bold = true })	-- Blue and bold for namespaces
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#ffaa00', italic = true })	-- Yellow and italic for identifiers
vim.api.nvim_set_hl(0, 'Constant', { fg = '#A020F0', bold = true })	-- Yellow and italic for identifiers
-- vim.api.nvim_set_hl(0, 'Operator', { fg = '#ff8800', bold = true })	-- Orange and bold for operators

-- Lsp diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ff0000', bg = '#000000', bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#ff0000', bg = '#000000' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#ff0000', bg = '#000000' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#ff0000', bg = '#000000' })

