call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'farmergreg/vim-lastplace'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
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

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'

" Theme
colorscheme nord
" highlight Normal ctermbg=black
