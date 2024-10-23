set nocompatible " no vi mess
set encoding=utf-8
filetype off
syntax on
filetype plugin indent on
set hidden
set ttyfast
set t_Co=256
set background=dark
set nofoldenable
let mapleader = "\<Space>"

set formatoptions=tcqrn1

set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

set modelines=0
set wildmenu
set wildmode=longest:list
set showmode
set showcmd
set laststatus=2

set ttimeoutlen=50
set scrolloff=15
set sidescrolloff=15
set backspace=indent,eol,start " backspace everything

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

set number
set cursorline
set ruler

set nobackup
set noswapfile
set nowritebackup

set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

nnoremap / /\v
vnoremap / /\v
map <leader><esc> :let @/=''<cr> " clear search

set splitright
set splitbelow

" 80 is a wondeful number
set colorcolumn=80

" I don't attempt to arrow anymore, but keeping here for nostalgia ❤️
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" fingers
command! Wq wq
command! WQ wq
command! W w
command! Q q

nnoremap Q <NOP>

noremap 0 ^
noremap ^ 0

nnoremap j gj
nnoremap k gk

" System Clipboard yankyputting
noremap <Leader>y "+y
noremap <Leader>p "+p

" Toggle case
nnoremap <Leader>t g~
nnoremap <Leader>tc ~h
nnoremap <Leader>tl g~~

" save
nnoremap <Leader>w :w<CR>

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" closing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" cycle through buffers
nnoremap <Leader><tab> :bn<CR>
nnoremap <Leader>` :bp<CR>
