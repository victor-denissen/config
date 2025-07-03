-- Minmap remaps
local keys = {
  "<leader>ns", "<leader>nu", "<leader>nf", "<leader>nbc", "<leader>nbo", "<leader>nbr",
  "<leader>nbt", "<leader>ntc", "<leader>nto", "<leader>ntr", "<leader>ntt",
  "<leader>nwc", "<leader>nwo", "<leader>nwr", "<leader>nwt", "<leader>nr",
  "<leader>nc", "<leader>no", "<leader>nm"
}
for _, key in ipairs(keys) do
  pcall(vim.keymap.del, 'n', key)
end
-- Global
vim.keymap.set("n", "<leader>mm", "<cmd>Neominimap toggle<cr>", { desc = "Toggle global minimap" })
vim.keymap.set("n", "<leader>mo", "<cmd>Neominimap on<cr>",     { desc = "Enable global minimap" })
vim.keymap.set("n", "<leader>mc", "<cmd>Neominimap off<cr>",    { desc = "Disable global minimap" })
vim.keymap.set("n", "<leader>mr", "<cmd>Neominimap refresh<cr>",{ desc = "Refresh global minimap" })

        -- Window-specific
vim.keymap.set("n", "<leader>mwt", "<cmd>Neominimap winToggle<cr>", { desc = "Toggle minimap for current window" })
vim.keymap.set("n", "<leader>mwr", "<cmd>Neominimap winRefresh<cr>",{ desc = "Refresh minimap for current window" })
vim.keymap.set("n", "<leader>mwo", "<cmd>Neominimap winOn<cr>",     { desc = "Enable minimap for current window" })
vim.keymap.set("n", "<leader>mwc", "<cmd>Neominimap winOff<cr>",    { desc = "Disable minimap for current window" })

        -- Tab-specific
vim.keymap.set("n", "<leader>mtt", "<cmd>Neominimap tabToggle<cr>", { desc = "Toggle minimap for current tab" })
vim.keymap.set("n", "<leader>mtr", "<cmd>Neominimap tabRefresh<cr>",{ desc = "Refresh minimap for current tab" })
vim.keymap.set("n", "<leader>mto", "<cmd>Neominimap tabOn<cr>",     { desc = "Enable minimap for current tab" })
vim.keymap.set("n", "<leader>mtc", "<cmd>Neominimap tabOff<cr>",    { desc = "Disable minimap for current tab" })

        -- Buffer-specific
vim.keymap.set("n", "<leader>mbt", "<cmd>Neominimap bufToggle<cr>", { desc = "Toggle minimap for current buffer" })
vim.keymap.set("n", "<leader>mbr", "<cmd>Neominimap bufRefresh<cr>",{ desc = "Refresh minimap for current buffer" })
vim.keymap.set("n", "<leader>mbo", "<cmd>Neominimap bufOn<cr>",     { desc = "Enable minimap for current buffer" })
vim.keymap.set("n", "<leader>mbc", "<cmd>Neominimap bufOff<cr>",    { desc = "Disable minimap for current buffer" })

        -- Focus controls
vim.keymap.set("n", "<leader>mf", "<cmd>Neominimap focus<cr>",       { desc = "Focus on minimap" })
vim.keymap.set("n", "<leader>mu", "<cmd>Neominimap unfocus<cr>",     { desc = "Unfocus minimap" })
vim.keymap.set("n", "<leader>ms", "<cmd>Neominimap toggleFocus<cr>", { desc = "Switch focus on minimap" })
