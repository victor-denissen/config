" General settings
set nocompatible              " Use Vim settings, rather than Vi settings
filetype plugin indent on     " Enable filetype detection, plugins, and indentation
syntax on                     " Enable syntax highlighting
set undofile					" Remember undo history
set undodir=~/.vim/undodir
set foldmethod=syntax
set foldlevelstart=10
set foldnestmax=3

" Toggle between syntax and manual folding mode when pressing zs
function! ToggleFoldingMode()
    if &foldmethod == 'syntax'
        set foldmethod=manual
    else
        set foldmethod=syntax
    endif
endfunction

nnoremap <silent> zs :call ToggleFoldingMode()<CR>


au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif		" Enable persistent cursor postition
set wildmenu					" Display command line's tab complete options as a menu
set noswapfile					" Disable swap file;
set nobackup
set nowritebackup
set autowrite					" Automatically write files before opening another file
set autoread					" Reload all files if changed externally
set	mouse=a						" Enable mouse to be used

" Auto Commands
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l
" Open Fugitive's :Git in a new tab on Vim startup
"autocmd VimEnter * tabnew | execute 'normal :Git<CR>'

"template paths
let g:tmpl_search_paths = ['~/Documents/git_collection/template/templates']


" UI settings
set relativenumber            " Show line numbers
set showcmd                   " Show (partial) command in the status line
set cursorline                " Highlight the current line
set cursorcolumn				" Highlight the current column
highlight CursorColumn guibg=grey20 ctermbg=235
set ruler						" Always show cursor position
set wildmenu                  " Show a command-line completion menu
set showmatch                 " Show matching brackets/parentheses
set incsearch                 " Show search matches as you type
set hlsearch                  " Highlight all search matches

" Indentation settings
set noexpandtab                 " Use spaces instead of tabs
set tabstop=4                 " Number of spaces a tab counts for
set shiftwidth=4              " Number of spaces for each auto-indent step
set smartindent               " Enable smart auto-indentation
set autoindent                " Enable auto-indentation
set smarttab                  " Use shiftwidth for tab commands

" Key mappings (general)
inoremap ij <Esc>1
vnoremap ij <Esc>1
nnoremap ij <Esc>1
nnoremap <leader><leader> :wq
inoremap <leader><leader> <Esc>:wq
vnoremap <leader><leader> <Esc>:wq
nnoremap zm zM
nnoremap <C-Space> <CR>


" Arrow key maps
nnoremap <Up>        <C-W>k
nnoremap <Down>      <C-W>j
nnoremap <Left>      <C-W>h
nnoremap <Right>     <C-W>l
nnoremap <S-Up>      <C-W>K
nnoremap <S-Down>    <C-W>J
nnoremap <S-Left>    <C-W>H
nnoremap <S-Right>   <C-W>L

command! -nargs=* -complete=command Tabe tabe <args> | :NERDTreeToggle | wincmd l

nnoremap ; :call AppendSemicolon()
function! AppendSemicolon()
    if getline('.') !~ ';$'
        execute "normal A;"
    endif
endfunction

" Key mappings (NERDTree) 
nnoremap <C-n> :NERDTreeToggle
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <silent> > :tabn
nnoremap <silent> < :tabp
nnoremap <C-Space> :NERDTreeMapCustomOpen


" Key mappings (ALE)
:nmap ]a :ALENextWrap<CR>
:nmap [a :ALEPreviousWrap<CR>
:nmap ]A :ALELast
:nmap [A :ALEFirst

" C-specific settings
autocmd FileType c setlocal cindent " Enable C indentation

" Plugins (optional)
" You can install plugins to extend Vim's functionality. Here's an example using Vundle:
" Install Vundle: https://github.com/VundleVim/Vundle.vim
" Add the following lines to your .vimrc:

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" Issue the following commands on a new pc:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" vim +PluginInstall +qall
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdcommenter'
" Add your plugins here
" Plugin 'tpope/vim-fugitive'    " Git integration
" Plugin 'itchyny/lightline.vim' " Lightweight statusline
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dense-analysis/ale'
Plugin 'tibabit/vim-templates'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Customize the appearance of your installed plugins
" For example, to customize lightline.vim:
" let g:lightline = { 'colorscheme': 'wombat' }
