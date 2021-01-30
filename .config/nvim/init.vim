if !exists('g:vscode')
    call plug#begin('~/.config/nvim/plugged')
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
    Plug 'farmergreg/vim-lastplace'
    Plug 'tpope/vim-surround'
    Plug 'vim-syntastic/syntastic'
    Plug 'jiangmiao/auto-pairs'
    Plug 'ap/vim-css-color'
    Plug 'dylanaraps/wal'
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    call plug#end()
    
    " Sets the clipboard to be the ctrl+c/v one
    set clipboard+=unnamedplus
    
    " Splits open at the bottom and the right.
    set splitbelow splitright
    
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
    
    " Lightline
    let g:lightline = {
        \ 'colorscheme': 'darcula',
        \ }
    
    " Theme
    colorscheme wal
endif
