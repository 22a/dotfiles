set nocompatible
filetype off

set number
set nobackup
set noswapfile
set nowritebackup
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set ttyfast
set autoindent
set ttimeoutlen=50
syntax on

"----------------------
" Key Bindings
"----------------------
nnoremap <C-p> :FZF<CR>


"----------------------
" Colour Things
"----------------------
set background=dark
colorscheme vimbrant
highlight ColorColumn ctermbg=7
highlight ColorColumn guibg=Gray

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
let g:syntastic_disabled_filetypes=['html']

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
" vim-plug
"----------------------
call plug#begin('~/.vim/plugged')

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" enhanced netrw
Plug 'tpope/vim-vinegar'


" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" auto wizzard completion
Plug 'Valloric/YouCompleteMe'


" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'

"Syntax Highlighting
Plug 'scrooloose/syntastic'

"Status Bar
Plug 'bling/vim-airline'

" git fuckery
Plug 'tpope/vim-fugitive'

" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  }

call plug#end()

