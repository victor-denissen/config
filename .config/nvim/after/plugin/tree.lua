-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    on_attach = function(bufnr)
        local api = require("nvim-tree.api") -- Ensure this is inside on_attach

        local function opts(desc)
            return { desc = "NvimTree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Remap cd into a directory
        vim.keymap.set("n", "cd", api.tree.change_root_to_node, opts("Change Root to Node"))

        -- Open file or directory with Enter
        vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))

        -- Close tree
        vim.keymap.set("n", "q", api.tree.close, opts("Close"))

        -- Remap a to add a file
        vim.keymap.set("n", "a", api.fs.create, opts("Create File or Directory"))

        -- Remap <C-v> to open in vertical split
        vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts("Open in Vertical Split"))

        -- Remap <C-t> to open in a new tab
        vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open in New Tab"))

        -- Remap <.> to toggle dotfiles
        vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))

        -- Remap <C-v> to open in horizontal split
        vim.keymap.set("n", "H", function()api.node.open.horizontal()end, opts("Open in Horizontal Split"))

        -- Remap <d> to delete file
        vim.keymap.set("n", "d", api.fs.remove, opts("Delete File or Directory"))

        -- Remap <r> to rename file
        vim.keymap.set("n", "r", api.fs.rename, opts("Rename File or Directory"))

    end,
})

--START REMAPS--

--Use ctrl-n to toggle tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true})

-- Remap 's' in nvim-tree to open file in split
vim.api.nvim_set_keymap('n', 's', '<Plug>(nvim-tree-enter-with)', { noremap = false, silent = true })
