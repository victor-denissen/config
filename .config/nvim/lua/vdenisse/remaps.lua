-- Navigate between panes using Ctrl+hjkl when in normal mode
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Navigate current pane using Ctrl+hjkl when in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Esc>:normal! h<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>:normal! j<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:normal! k<CR>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>:normal! l<CR>a', { noremap = true, silent = true })

-- Remap 'ij' to return to normal mode
vim.api.nvim_set_keymap('i', 'ij', '<Esc>:wa<CR>', { noremap = true, silent = true })

-- Remap 'qq' to close current file
vim.api.nvim_set_keymap('n', 'qq', ':q<CR>', { noremap = true, silent = true})

-- Remap 'ww' to save all files
vim.api.nvim_set_keymap('n', 'ww', ':wa<CR>', { noremap = true, silent = true})

-- Remap ':T' to initiate template
vim.api.nvim_set_keymap('n', 'TT', ":TemplateInit<CR>", { noremap = true, silent = true})
