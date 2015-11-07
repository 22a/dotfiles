set nocompatible
filetype off


"----------------------
" General Wizardry
"----------------------
syntax on

" better % skulduggery
runtime macros/matchit.vim

" civ4 victory by space-race
let mapleader = " "

" command / status line
set wildmenu
set wildmode=longest:list
set showcmd
set noshowmode
set laststatus=2

" text manipulation
set backspace=indent,eol,start      " backspace everything"

" gutter
set number
set cursorline

" files
set nobackup
set noswapfile
set nowritebackup

" tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" typing
set ttimeoutlen=50

" shame
set noerrorbells
set visualbell

" scroll
set scrolloff=15
set sidescrolloff=15
set ttyfast


"----------------------
" Key Bindings
"----------------------

" Begone foul arrows
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Ctrl-P for fzf
nnoremap <C-p> :FZF<CR>

" Trim Leading WS
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" System Clipboard yankyputting
"  yank to cliploard without motion
noremap <Leader>c "*y
"  yank line to clipboard
noremap <Leader>cl "*yy
"  yank file to clipboard
noremap <Leader>cf gg"*yG
"  paste from system clipboard
noremap <Leader>p "*p
noremap <Leader>P "*P


"----------------------
" Colour Things
"----------------------
let g:solarized_termcolors=256
colorscheme solarized
set background=dark


"----------------------
" Syntactic
"----------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_checkers=['']


"----------------------
" Buffers
"----------------------
set hidden
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>


"----------------------
" Status Bar
"----------------------
let g:airline_theme='murmur'
let g:airline#extensions#syntastic#enabled=1
set laststatus=2
let g:airline_powerline_fonts = 1


"----------------------
" Sneaky Functions
"----------------------
function! TrimWhitespace()
  %s/\s\+$//e
endfunc


"----------------------
" Plugins
"----------------------
call plug#begin('~/.vim/plugged')

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" enhanced netrw salad
Plug 'tpope/vim-vinegar'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Wizard Autocompletion
Plug 'ervandew/supertab'

" Snippets in your bippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'
Plug 'adimit/prolog.vim'
Plug 'dag/vim2hs'

"Syntax Highlighting
Plug 'scrooloose/syntastic'

"Status Bar
Plug 'bling/vim-airline'

" git fuckery
Plug 'tpope/vim-fugitive'

" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

call plug#end()
