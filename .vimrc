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

" Naviagion in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

" Splits made easy
set splitright
set splitbelow
nnoremap <C-w>v :vnew<cr>
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j

" Command keybinds
nmap <F2> :NERDTreeToggle<cr>
nmap <F3> :TagbarToggle<cr>

"" search and sub case sensitivity
set ignorecase
set smartcase

"" plugins
call plug#begin('~/.vim/plugged')
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
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

"" Plugin Settings
" YCM
let g:ycm_always_populate_location_list=1
set completeopt-=preview

"" Color Settings
"  airline themes
let g:airline_theme='monochrome'
" YCM colors
highlight Pmenu ctermfg=9 ctermbg=1
highlight clear SignColumn
highlight YcmErrorSection ctermfg=160
highlight YcmErrorSign ctermfg=160
highlight YcmWarningSection ctermfg=0 ctermbg=7
highlight YcmWarningSign ctermfg=7
" GitGutter and Diff colors
highlight DiffAdd       ctermbg=9   ctermfg=0
highlight DiffChange    ctermbg=7   ctermfg=0
highlight DiffDelete    ctermbg=160 ctermfg=0
highlight GitGutterAddLine      ctermfg=9 
highlight GitGutterChangeLine   ctermfg=7
highlight GitGutterDeleteLine   ctermfg=160
" general colors
highlight LineNr ctermfg=9          " line number
highlight PreProc ctermfg=9         " preprocessor instructions  (i.e. #include statements)
highlight Statement ctermfg=9       " if statements and logic
highlight Identifier ctermfg=9      " Variable names 
highlight MatchParen ctermfg=0 ctermbg=9
highlight Error ctermfg=160
