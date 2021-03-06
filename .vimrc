set nocompatible

" Automatic reloading of .nvimrc
autocmd! bufwritepost vimrc source ~/.nvimrc
autocmd! bufwritepost .nvimrc source %

" Set mapleader to comma
let mapleader = ','

" Bind Ctrl + [h,j,k,l] for quick window movement
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

" Easy sorting of selected lines
vnoremap <Leader>s :sort<CR>

" Better indenting of code block
vnoremap < <gv
vnoremap > >gv

" Enable syntax highlighting
syntax on

" Turn off filetype detection
filetype off

" Turn on filetype plugin detection and indent files
filetype plugin indent on

" Turn off code folding from python-mode
let g:pymode_folding = 0
" Turn off python-mode breakpoints
let g:pymode_breakpoint = 0
" Turn off python-mode code checking (I am using syntastic)
let g:pymode_lint = 0
" Turn off python-mode rope
let g:pymode_rope = 0

" NERDTree should ignore Python binary files
let NERDTreeIgnore = ['\.pyc$']
" Map Ctrl + x to open NERDTree file explorer
nnoremap <C-x> :NERDTreeToggle<CR>
inoremap <C-x> <Esc>:NERDTreeToggle<CR>

" Vertical split for UltiSnips edit window
let g:UltiSnipsEditSplit = 'vertical'

" Ctrlp should ignore some hidden folders and binary/temp files
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(pyc|swp|so|class)$',
            \ }

" Set Syntastic to use python and flake8 checkers for Python
let g:syntastic_python_checkers = ['python', 'flake8']
" Ignore some conventions and set line length to 85
let g:syntastic_python_flake8_args = '--ignore=E302 --max-line-length=85'
" Turn on header checking for C++
let g:syntastic_cpp_check_header = 1

" Turn on powerline fonts for airline
let g:airline_powerline_fonts = 1
" Set theme for airline
let g:airline_theme = 'powerlineish'

" Move line up
nnoremap m :m .-2<CR>==
inoremap m <Esc>:m .-2<CR>==gi
" Move block up
vnoremap m :m '<-2<CR>gv=gv
" Move line down
nnoremap n :m .+1<CR>==
inoremap n <Esc>:m .+1<CR>==gi
" Move block down
vnoremap n :m '>+1<CR>gv=gv

" Make files should use tabs instead of spaces
autocmd FileType make setlocal noexpandtab

" Set relative numbers with current line number on cursor line
set relativenumber
set number
" Switch to absolute numbers in Insert mode
autocmd InsertEnter * set number norelativenumber
" Switch back to relative numbers in Normal mode
autocmd InsertLeave * set number relativenumber

" Set dark background
set background=dark

" Set tab to result in 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Set smartindent so after newline cursor is at right place
set smartindent

" Ignores case
set ignorecase

" Highlight searched word
set incsearch

" Always show status bar
set laststatus=2

" Reload file if it was changed
set autoread

" Show options for command complete above
set wildmenu

" Show vertical line on 85 column
set colorcolumn=85

" Show incomplete command ("+y)
set showcmd

" 'h' and 'l' move to next line when hit wrap
set whichwrap=<,>,h,l

" Persistent undo, it remember changes after file is closed
set undofile
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000

" Highlight matched parentheses with light blue background
highlight MatchParen ctermbg=LightBlue

" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
" Show trailing whitespace as dot
" Show tab character as >-
set list
set listchars=trail:·,tab:>-

" Set backspace behavior
set backspace=indent,eol,start

" Equal sizes of splits when window resize
au VimResized * :wincmd =