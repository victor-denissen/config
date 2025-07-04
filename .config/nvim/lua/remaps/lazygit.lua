-- Setup mapping to call :LazyGit
vim.api.nvim_set_keymap('n', '<leader>lg', ':LazyGit<CR>', {silent = true})
-- whichkey.lua
local wk = require("which-key")

wk.add({
    { "<leader>l", group='Lazygit'}
})
