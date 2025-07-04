-- Remap '<leader>w' to save all files
vim.keymap.set('n', '<leader>ww', function()
    vim.cmd('w')
    vim.notify("Saved file", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc='Save current file' })

vim.keymap.set('n', '<leader>wa', function()
  vim.cmd('wa')  -- Write all files
  vim.notify("💾 All files saved, mission accomplished.", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc='Save all files'  })


vim.keymap.set('n', '<leader>wq', function()
  vim.cmd('w')
  vim.cmd('q')
  vim.notify("Saved And Deleted File", vim.log.levels.INFO)
end, { noremap = true, silent = true, desc='Save all files'  })

-- mappings.lua
vim.keymap.set("n", "<leader>ww", function() vim.cmd("w") end, { desc = "Save current file" })
vim.keymap.set("n", "<leader>wa", function() vim.cmd("wa") end, { desc = "Save all files" })

-- whichkey.lua
local wk = require("which-key")

wk.add({
    { "<leader>w", group='Save File Options'}
})
