-- Navigate between panes using Ctrl+hjkl when in normal mode
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Scroll up and down in normal mode using ctrl-shift h/j/k/l
vim.api.nvim_set_keymap('n', '<Up>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-y>', { noremap = true, silent = true })


-- Navigate current pane using Ctrl+hjkl when in insert mode
-- vim.api.nvim_set_keymap('i', '<C-h>', '<Esc>:normal! h<CR>a', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-j>', '<Esc>:normal! j<CR>a', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>:normal! k<CR>a', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-l>', '<Esc>:normal! l<CR>a', { noremap = true, silent = true })

-- Remap 'ij' to return to normal mode
vim.api.nvim_set_keymap('i', 'ij', '<Esc>:wa<CR>', { noremap = true, silent = true })

-- Remap 'qq' to close current file
vim.api.nvim_set_keymap('n', 'qq', ':q<CR>', { noremap = true, silent = true})

-- Remap 'ww' to save all files
vim.api.nvim_set_keymap('n', 'ww', ':wa<CR>', { noremap = true, silent = true})

-- Remap ':T' to initiate template
vim.api.nvim_set_keymap('n', 'TT', ":TemplateInit<CR>", { noremap = true, silent = true})



-- LspZero maps

local lsp = require('lsp-zero')

lsp.preset('recommended')

local opts = { buffer = bufnr, remap = false }

-- Standard LSP shortcuts
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Diagnostics shortcuts
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
