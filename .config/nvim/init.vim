" Start vim plug
call plug#begin('~/.config/nvim/plugged')
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'joshdick/onedark.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
" Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'dylanaraps/wal'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:deoplete#enable_at_startup = 1
call plug#end()

" Sets the clipboard to be the ctrl+c/v one
set clipboard+=unnamedplus

" Splits open at the bottom and the right.
set splitbelow splitright

" Save files as sudo on files that require root permisson 
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Some basic stuff
syntax on
set nocompatible
set encoding=utf-8
set number
set spell spelllang=en_ca
set shiftwidth=4
set hidden
set ignorecase
set smartcase
set mouse=a
set linebreak

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'minimalist'

" Theme
colorscheme wal
" highlight Normal ctermbg=black
