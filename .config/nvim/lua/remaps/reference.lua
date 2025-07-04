-- References remaps
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

vim.keymap.set("n", "<leader>gr", function()
  local params = vim.lsp.util.make_position_params()
  params.context = { includeDeclaration = true }

  vim.lsp.buf_request(0, "textDocument/references", params, function(err, result, ctx)
    if err then
      vim.notify("LSP references error: " .. err.message, vim.log.levels.ERROR)
      return
    end
    if not result or vim.tbl_isempty(result) then
      vim.notify("No references found", vim.log.levels.INFO)
      return
    end
    local items = vim.lsp.util.locations_to_items(result, vim.lsp.get_client_by_id(ctx.client_id).offset_encoding)
    vim.fn.setqflist({}, ' ', { title = 'LSP References (silent)', items = items })
    -- Stealth mode: no :copen
  end)
end, { desc = "LSP: References (silent)" })
vim.keymap.set("n", "<leader>gn", ":cnext<cr>", { desc='Go to next reference' })
vim.keymap.set("n", "<leader>gp", ":cprev<cr>", { desc='Go to prev reference' })

-- whichkey.lua
local wk = require("which-key")

wk.add({
    { "<leader>g", group='Reference'}
})
