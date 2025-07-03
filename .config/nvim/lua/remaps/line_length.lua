-- Store toggle state globally
_G.line_length_enabled = true

-- Store autocmd ID so we can delete it later
_G.line_length_autocmd_id = nil

-- Function to set or remove the autocmd
local function toggle_line_length_check()
  local ns_id = vim.api.nvim_create_namespace("line_length")

  if _G.line_length_enabled then
    -- Disable: remove autocmd + clear diagnostics
    if _G.line_length_autocmd_id then
      vim.api.nvim_del_autocmd(_G.line_length_autocmd_id)
      _G.line_length_autocmd_id = nil
    end
    vim.diagnostic.reset(ns_id)
    print("Line length check disabled")
  else
    -- Enable: create autocmd
    _G.line_length_autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*",
      callback = function(args)
        local bufnr = args.buf
        local diagnostics = {}
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        for i, line in ipairs(lines) do
          if #line > 79 then
            table.insert(diagnostics, {
              lnum = i - 1,
              col = 79,
              severity = vim.diagnostic.severity.WARN,
              message = "Line exceeds 79 characters",
              source = "line_length",
            })
          end
        end
        vim.diagnostic.set(ns_id, bufnr, diagnostics)
      end,
    })
    print("Line length check enabled")
  end

  _G.line_length_enabled = not _G.line_length_enabled
end

-- 🗝️ Map the toggle to <leader>tl
vim.keymap.set("n", "<leader>tl", toggle_line_length_check, { noremap = true, silent = true, desc = "Toggle line length check" })
