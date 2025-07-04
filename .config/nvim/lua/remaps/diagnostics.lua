-- Diagnostics shortcuts
vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc='Go to next diagnostic' })
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc='Go to next diagnostic' })

local wk = require("which-key")

wk.add({
    { "<leader>d", group='Diagnostics'}
})


local state_file = vim.fn.stdpath('config') .. '/.states/diagnostics_toggle_state'

local function save_state(enabled)
  local f = io.open(state_file, 'w')
  if f then
    f:write(enabled and '1' or '0')
    f:close()
  end
end

local function load_state()
  local f = io.open(state_file, 'r')
  if f then
    local content = f:read('*l')
    f:close()
    return content == '1'
  end
  return true  -- default enabled if no file
end

local function toggle_diagnostics()
  _G.diagnostics_enabled = not _G.diagnostics_enabled

  if _G.diagnostics_enabled then
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  end

  save_state(_G.diagnostics_enabled)
end


-- Load state at startup
_G.diagnostics_enabled = load_state()

-- 🔧 Keybinding
vim.keymap.set("n", "<leader>dt", toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle all diagnostics" })
