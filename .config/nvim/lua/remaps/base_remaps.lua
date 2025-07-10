vim.g.mapleader = " "
vim.g.maplocglleader = " "




-- Navigate between panes using Ctrl+hjkl when in normal mode
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Scroll up and down in normal mode using ctrl-shift h/j/k/l
vim.api.nvim_set_keymap('n', '<Up>', '<C-e>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-y>', { noremap = true, silent = true })



-- Remap 'ij' to return to normal mode
vim.api.nvim_set_keymap('i', 'ij', '<Esc>:wa<CR>', { noremap = true, silent = true })
-- Remap 'ok' to return to normal mode
vim.api.nvim_set_keymap('i', 'ok', '<Esc>:wa<CR>', { noremap = true, silent = true })

-- Remap '<leader>q' to close current file
vim.api.nvim_set_keymap('n', '<leader>qq', ':q<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>qa', ':qa<CR>', { noremap = true, silent = true})

-- whichkey.lua
local wk = require("which-key")

wk.add({
    { "<leader>q", group='Quit File Options'}
})


-- Remap 'TT' to initiate template
vim.api.nvim_set_keymap('n', 'TT', ":TemplateInit<CR>", { noremap = true, silent = true}) -- this a comment


-- Remap <leader>o to create ne line without going into insert mode
vim.api.nvim_set_keymap('n', '<leader>o', ":put _<CR>", { noremap = true, silent = true, desc='New line below'})
vim.api.nvim_set_keymap('n', '<leader>O', ":put! _<CR>", { noremap = true, silent = true, desc='New line above'})


function ToggleCenteredCursor()
  if centered_mode then
    -- turn off centering
    vim.opt.scrolloff = 15   -- or whatever your usual setting is
    vim.opt.cursorline = true
    centered_mode = false
    print("Centered cursor OFF")
  else
    -- turn on centering
    vim.opt.scrolloff = 999
    vim.opt.cursorline = true
    centered_mode = true
    vim.cmd("normal! zz")
    print("Centered cursor ON")
  end
end

-- Map it to a key (e.g., zz)
vim.keymap.set("n", "zz", ToggleCenteredCursor, { desc = "Toggle Centered Cursor" })


vim.keymap.set("n", "<leader>cws", function()
  vim.cmd([[%s/\s\+$//e]])
end, { desc = "Clear all trailing whitespace" })
