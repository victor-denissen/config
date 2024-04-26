require("vdenisse")


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

