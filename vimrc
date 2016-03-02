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
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('eight_spoked_asterisk')
  let g:gitgutter_sign_modified = emoji#for('zap')
  let g:gitgutter_sign_removed = emoji#for('no_entry')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

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

" sane vim split directions
set splitright
set splitbelow

" quickscope on fFtT only
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" 80 is a number
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


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
noremap <Leader>y "*y
"  yank line to clipboard
noremap <Leader>yl "*yy
"  yank file to clipboard
noremap <Leader>yf gg"*yG
"  paste from system clipboard
noremap <Leader>p "*p

" no EX mode thank you very much
nnoremap Q <NOP>

" Easily make changes to vimrc
nnoremap <Leader>R :so ~/.vimrc<CR>
nnoremap <Leader>U :PlugInstall<CR>:PlugUpdate<CR>:PlugClean<CR>

" hide pesky hls
noremap <silent> <Esc> :noh<CR><Esc>

" Toggle case
nnoremap <Leader>tcw g~iw

" fast file rename
nnoremap <Leader>fr :call RenameFile()<cr>


"----------------------
" Colour Things
"----------------------
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
highlight ExtraWhitespace ctermbg=red


"----------------------
" file save check man
"----------------------
" -- Neomake
autocmd! BufWritePost * Neomake


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
" html tag autoclose
"----------------------
let g:closetag_filenames = "*.html,*.erb"

"----------------------
" Sneaky Functions
"----------------------
function! TrimWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc


function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction


"----------------------
" Plugins
"----------------------
call plug#begin('~/.vim/plugged')

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Wizard Autocompletion
Plug 'ervandew/supertab'

" Snippets in your bippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Languages
Plug 'kchmck/vim-coffee-script'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'cakebaker/scss-syntax.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-rails'
Plug 'adimit/prolog.vim'
Plug 'dag/vim2hs'

" WOW
Plug 'tpope/vim-dispatch'

" Emoji are great
Plug 'junegunn/vim-emoji'

" Commenting out code is fun
Plug 'tpope/vim-commentary'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" Speedy left right
Plug 'unblevable/quick-scope'

" Syntax Highlighting
Plug 'benekastah/neomake'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git fuckery
Plug 'tpope/vim-fugitive'

" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'

call plug#end()
