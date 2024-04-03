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
set noswapfile					" Disable swap file
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

" Automatically write structure for C++ class files
autocmd BufNewFile *.hpp execute 'normal! i#ifndef ' . substitute(toupper(expand('%:t')), '\.', '_', 'g') . '# define ' . substitute(toupper(expand('%:t')), '\.', '_', 'g') . '// Custom class: ' . substitute(expand('%:t'), '\.hpp', '', 'g') .  'xxaclass    ' . substitute(expand('%:t'), '\.hpp', '', 'g') . '{public:// Constructorxxa' . substitute(expand('%:t'), '\.hpp', '', 'g') . '(void);// Copy constructorxxa' . substitute(expand('%:t'), '\.hpp', '', 'g') . '(const ' . substitute(expand('%:t'), '\.hpp', '', 'g') . '& other);// Copy assignment operator overloadxxa' . substitute(expand('%:t'), '\.hpp', '', 'g') . '& operator = (const ' . substitute(expand('%:t'), '\.hpp', '', 'g') . '& other);// Destructorxxa~' . substitute(expand('%:t'), '\.hpp', '', 'g') . '(void);protected:;private:/*_*/;};#endifkkkwlllll'

autocmd BufNewFile *.h execute 'normal! i#ifndef ' . substitute(toupper(expand('%:t')), '\.', '_', 'g') . '# define ' . substitute(toupper(expand('%:t')), '\.', '_', 'g') . '/* Includes */# include <iostream> //input\outputxxa# include <> //xxa/* Custom classes */# include "ClassHeaders/.hpp" //Custom class: xxa/* Functions */// xxa#endifkkkkkkkkkkkwl'

" Automatically write the structure for C++ files
autocmd BufNewFile *.cpp if expand('%:t') == "main.cpp" | execute 'normal! i#include "main.h"// xxaint    main(void){;}kw' | else | execute 'normal! i#include "../main.h"// Constructorxxa' . substitute(expand('%:t'), '\.cpp', '', 'g') . '::' . substitute(expand('%:t'), '\.cpp', '', 'g') . '(void){std::cout << "' . substitute(expand('%:t'), '\.cpp', '', 'g') . ': creating object\n";}// Copy constructorxxa' . substitute(expand('%:t'), '\.cpp', '', 'g') . '::' . substitute(expand('%:t'), '\.cpp', '', 'g') . '(const ' . substitute(expand('%:t'), '\.cpp', '', 'g') . '& other){std::cout << "' . substitute(expand('%:t'), '\.cpp', '', 'g') . ': copying object\n";*this = other;}// Copy assignment operator overloadxxa' . substitute(expand('%:t'), '\.cpp', '', 'g') . '& ' . substitute(expand('%:t'), '\.cpp', '', 'g') . '::operator = (const ' . substitute(expand('%:t'), '\.cpp', '', 'g') . '& other){std::cout << "' . substitute(expand('%:t'), '\.cpp', '', 'g') . ': copying object (assignement)\n";if (this != &other)/*this->_ = other._*/;return (*this);}// Destructorxxa' . substitute(expand('%:t'), '\.cpp', '', 'g') . '::~' . substitute(expand('%:t'), '\.cpp', '', 'g') . '(void){std::cout << "' . substitute(expand('%:t'), '\.cpp', '', 'g') . ': destroying object\n";}kkkkkkkkwwwwwwwwwll' | endif



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
inoremap tg gT
vnoremap tg gT
nnoremap tg gT
nnoremap <leader><leader> :wq
inoremap <leader><leader> <Esc>:wq
vnoremap <leader><leader> <Esc>:wq
nnoremap zm zM
nnoremap ; :call AppendSemicolon()
nnoremap j k
nnoremap k j
"nnoremap :w :wa 
"nmap :W :w
command! -nargs=* -complete=command Tabe tabe <args> | :NERDTreeToggle | wincmd l

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


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Customize the appearance of your installed plugins
" For example, to customize lightline.vim:
" let g:lightline = { 'colorscheme': 'wombat' }
