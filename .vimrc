set nocompatible
filetype off
set number              " add line numbers
set nowrap              " turn off automatic wrapping
set formatoptions-=t    " turn off automatic wrapping when typing
syntax on

set expandtab      " tabs are automatically converted to spaces
set tabstop=4      " tab is four spaces
set softtabstop=4  " backspace deletes four spaces as one tab
set shiftwidth=4   " number of spaces for autoindentin
set autoindent     " autoindent on new line

set showmatch      " show matching parenthesis

"" search and sub case sensitivity
set ignorecase
set smartcase

"" plugins
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ackyshake/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Valloric/YouCompleteMe'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

"" Color Settings
"  airline themes
let g:airline_theme='monochrome'
" YCM colors
highlight Pmenu ctermfg=9 ctermbg=1
highlight clear SignColumn
" general colors
highlight LineNr ctermfg=9          " line number
highlight PreProc ctermfg=9         " preprocessor instructions  (i.e. #include statements)
highlight Statement ctermfg=9       " if statements and logic
highlight Identifier ctermfg=9      " Variable names 
