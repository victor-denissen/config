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

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
