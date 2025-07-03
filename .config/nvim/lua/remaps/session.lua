-- Get session directory from environment
local session_dir = vim.fn.getenv("NVIM_SESSION_DIR")
if session_dir == "" then
    session_dir = "."  -- fallback to current directory if env var is not set
end

-- Ensure the path ends with a slash
if not session_dir:match("/$") then
    session_dir = session_dir .. "/"
end


-- User command for custom session creation
vim.api.nvim_create_user_command("CustomSessionQuit", function()
    local session_path = session_dir .. "old.vim"
    local nvim_state = require("nvim-tree.api").tree.is_visible()
    if nvim_state then
        require("nvim-tree.api").tree.close()
    end
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
    vim.cmd('wa')
    vim.cmd("quitall")
end, {})

-- Save and quit, saving session to 'end.vim'
vim.keymap.set("n", "<leader>sq", ":CustomSessionQuit<cr>", opts)

-- Save default session
-- vim.keymap.set("n", "<leader>sd", ":mksession! " .. session_dir .. "default.vim<cr>", opts)


-- User command for custom session creation
vim.api.nvim_create_user_command("CustomSessionCreate", function()
    vim.ui.input({ prompt = "Session Name: " }, function(input)
        if input then
            local session_path = session_dir .. input .. ".vim"
            local nvim_state = require("nvim-tree.api").tree.is_visible()
            if nvim_state then
                require("nvim-tree.api").tree.close()
            end
            vim.cmd("mksession! " .. vim.fn.fnameescape(session_path))
            if nvim_state then
                require("nvim-tree.api").tree.toggle({ focus = false })
            end
        end
    end)
end, {})

-- Map for custom session
vim.keymap.set("n", "<leader>ss", ":CustomSessionCreate<cr>", opts)
