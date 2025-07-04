require("plugins")
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
vim.opt.guifont = "HeavyData Nerd Font:h14"


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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.zsh", "*.zshrc", "*.zshenv", "*.zshrc.dir/*" },
  callback = function()
    vim.bo.filetype = "zsh"
  end,
})
-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99      -- Start with folds open
vim.opt.foldenable = true   -- Enable folding
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        vim.opt.foldmethod = "indent"
        vim.opt.foldenable = true
        vim.opt.foldlevel = 99
    end
})


-- All my colours shit
vim.o.termguicolors = true
vim.cmd('colorscheme default')

vim.api.nvim_set_hl(0, 'Normal', { fg = '#ffffff', bg = '#000000' }) -- White text on black background


-- vim.api.nvim_set_hl(0, 'Identifier', { fg = '#F06C00', italic = true }) -- Orange for variables
vim.api.nvim_set_hl(0, 'Type', { fg = '#00ff88', italic=true })		-- Green for types
vim.api.nvim_set_hl(0, 'Comment', { fg = '#625DF0', italic = true })	-- Dark blue for comments
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#00ff88', bg = '#1c1c1c' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#00ff88', bold = true })
vim.api.nvim_set_hl(0, 'Function', { fg = '#F06C00', bold = true })	-- Orange for functions
vim.api.nvim_set_hl(0, 'String', { fg = '#E00000', italic = true })	-- Red for strings
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#E00074', bold = true })	-- Pink for preprocs (#include)
vim.api.nvim_set_hl(0, 'Statement', { fg = '#DBE000', bold = true })	-- Yellow for statements (return)
vim.api.nvim_set_hl(0, 'Namespace', { fg = '#F06C00', bold = true })	-- Blue and bold for namespaces
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#ffaa00', italic = true })	-- Yellow and italic for identifiers
vim.api.nvim_set_hl(0, 'Constant', { fg = '#A020F0', bold = true })	-- Yellow and italic for identifiers
-- vim.api.nvim_set_hl(0, 'Operator', { fg = '#ff8800', bold = true })	-- Orange and bold for operators

-- Lsp diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#ff0000', bg = '#000000', bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#ff0000', bg = '#000000' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#ff0000', bg = '#000000' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#ff0000', bg = '#000000' })

