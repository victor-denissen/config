require("remaps")

vim.opt.tabstop = 4        -- Number of spaces a tab counts for
vim.opt.shiftwidth = 4     -- Number of spaces for indentation
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.softtabstop = 4     -- Makes backspace behave consistently
vim.opt.smartindent = true  -- Auto-indent new lines
vim.opt.autoindent = true   -- Copy indent from current line
vim.opt.list = true
vim.opt.listchars = { tab = "»·", trail = "·", extends = ">", precedes = "<" }
vim.opt.scrolloff = 15

-- Show a vertical line at column 79
vim.opt.colorcolumn = "79"

-- Set default highlight for the color column
vim.cmd([[highlight ColorColumn guibg=#442222]])


-- Set line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Folds
-- Set foldmethod to syntax
vim.api.nvim_command('set foldmethod=syntax')

-- Set foldlevelstart to 10
vim.api.nvim_command('set foldlevelstart=10')

-- Set foldnestmax to 3
vim.api.nvim_command('set foldnestmax=3')

-- Enable showcmd
vim.opt.showcmd = true

-- Enable cursorline
vim.opt.cursorline = true

-- Set cursorline to be underline
vim.cmd('hi CursorLine gui=underline cterm=underline gui=underline guifg=NONE guibg=NONE')

-- Enable cursorcolumn
vim.opt.cursorcolumn = true

-- Set up highlighting for CursorColumn
vim.cmd('highlight CursorColumn ctermbg=236 guibg=grey10')

-- Enable ruler
vim.opt.ruler = true

-- Enable wildmenu
vim.opt.wildmenu = true

-- Enable showmatch
vim.opt.showmatch = true

-- Enable incremental search
vim.opt.incsearch = true

-- Enable highlighting of search matches
vim.opt.hlsearch = true

-- Highlight trailing spaces and tabs
vim.api.nvim_command("highlight ExtraWhitespace ctermbg=red guibg=red")
vim.api.nvim_command("match ExtraWhitespace /\\s\\+$/")

vim.api.nvim_create_autocmd({"BufWinEnter", "InsertLeave"}, {
    pattern = "*",
    command = "match ExtraWhitespace /\\s\\+$/"
})

vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "match none"
})

-- FUCKING OBLITERATE MINIMAP MAPPING
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy", -- Triggered after Lazy.nvim finishes loading plugins
  callback = function()
    local keys = {
      "<leader>ns", "<leader>nu", "<leader>nf", "<leader>nbc", "<leader>nbo", "<leader>nbr",
      "<leader>nbt", "<leader>ntc", "<leader>nto", "<leader>ntr", "<leader>ntt",
      "<leader>nwc", "<leader>nwo", "<leader>nwr", "<leader>nwt", "<leader>nr",
      "<leader>nc", "<leader>no", "<leader>nm"
    }

    for _, key in ipairs(keys) do
      pcall(vim.keymap.del, 'n', key)
    end

    -- Optional: now map your own <leader>n
    vim.keymap.set("n", "<leader>n", ":echo 'My custom <leader>n!'<CR>", { noremap = true, silent = true })
  end,
})

