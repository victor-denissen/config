
return function(use)
  use {
        "Isrothy/neominimap.nvim",
        -- tag = "v3.x.x", -- same as `version` in lazy.nvim
        config = function()
            -- Recommended settings when layout == "float"
            vim.opt.wrap = false
            vim.opt.sidescrolloff = 36

            -- Plugin configuration
            vim.g.neominimap = {
                auto_enable = true,
            }

            -- Keybindings (you can move this to a keymaps file if you prefer)
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true, desc = "" }

        end,
  }
end
