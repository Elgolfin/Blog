let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" See https://vimsheet.com/

" Enable the filetype detection (also load the related plugin and indentation config) 
filetype plugin indent on

" Enable Line Numbering
set number

set cursorline

" Convert tab to space
set expandtab
" Define the length of spaces for a tab
set tabstop=4
" Removing a tab removes 4 spaces at once
set softtabstop=4

set autoindent

" Enable color syntax highlighting
syntax on

" Open new split panes and put the focus on them directly
set splitright
set splitbelow

" Ignore case when searching the value in lowercase
set smartcase

" Highlight search matches
set hlsearch

set wildmenu
set wildmode=longest:full

" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
"Plug 'powerline/powerline'
"Plug 'powerline/fonts'
"Plug 'powerline/powerline-fonts'
Plug 'vim-airline/vim-airline-themes'
"Plug 'valloric/youcompleteme'

" Initialize plugin system
call plug#end()

let g:airline_powerline_fonts = 1
"let g:molokai_original = 1
"

set t_Co=256
colorscheme molokai
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0

"Netrw options
"https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_keepdir = 0
let g:netrw_browse_split = 4
"Use the previous window to open file
let g:netrw_altv = 1
