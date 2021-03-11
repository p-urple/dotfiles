set number

set expandtab ts=4 sw=4 ai

syntax on

set wrap!

"" search and sub case sensitivity
set ignorecase
set smartcase

"" plugins
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'PhilRunninger/nerdtree-visual-selection'
call plug#end()

"" plugin settings
"  airline themes
let g:airline_theme='monochrome'
