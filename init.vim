:set ma
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:syntax on
:set cursorline
:filetype plugin indent on
" :set backupdir=~/.cache/vim

call plug#begin("~/.vim/plugged")

Plug 'http://github.com/tpope/vim-surround'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/dracula/vim'

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nnoremap <C-/> :TerminalSplit bash<CR>

nnoremap <C-p> :TagbarToggle<CR>

nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-i> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-j> <C-W>H
nnoremap <A-k> <C-W>J
nnoremap <A-i> <C-W>K
nnoremap <A-l> <C-W>L

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-q> :q<CR>
nnoremap <A-w> :w<CR>

:set completeopt-=preview

:colorscheme dracula

let g:coc_disable_startup_warning = 1
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"

let g:airline_powerline_fonts = 1

let g:Terminal_PyVersion = 3
let g:Terminal_CloseOnEnd = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

autocmd vimenter * if !argc() | TerminalSplit bash | endif
autocmd vimenter * if !argc() | NERDTree | endif