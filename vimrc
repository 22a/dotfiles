"----------------------
" Plugins
"----------------------
call plug#begin('~/.vim/plugged')

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Wizard Autocompletion
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
if has('nvim')
  Plug 'shougo/deoplete.nvim'
else
  Plug 'ajh17/VimCompletesMe'
end

" Snippets in your bippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Text mangeling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'

" Languages
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'adimit/prolog.vim'
Plug 'dag/vim2hs'
Plug 'elixir-lang/vim-elixir'

" tpope is dispatching whiz
Plug 'tpope/vim-dispatch'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" Speedy left right
Plug 'unblevable/quick-scope'

" Syntax Highlighting
Plug 'benekastah/neomake'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git swizzeling
Plug 'tpope/vim-fugitive'

" Directory exploration
Plug 'justinmk/vim-dirvish'

" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'

" tranquil poetry mode
Plug 'junegunn/goyo.vim'

call plug#end()


"----------------------
" General Wizardry
"----------------------
filetype off
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
" Autocomplete
"----------------------
if has('nvim')
  let g:deoplete#enable_at_startup = 1
end


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

" no EX mode thank you very much
nnoremap Q <NOP>

" hide pesky hls
noremap <silent> <Esc> :noh<CR><Esc>


"----------------------
" Leader
"----------------------
" Easily make changes to vimrc
nnoremap <Leader>R :so ~/.vimrc<CR>
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

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

" Toggle case
nnoremap <Leader>t g~
nnoremap <Leader>tc ~h
nnoremap <Leader>tl g~~

" fast file rename
nnoremap <Leader>rf :call RenameFile()<cr>

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" colsing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" fingers
command! Wq wq
command! WQ wq
command! W w
command! Q q

" easy poetry
nnoremap <Leader>g :Goyo<CR>


"----------------------
" Colour Things
"----------------------
let base16colorspace=256
colorscheme base16-google
set background=dark
highlight ExtraWhitespace ctermbg=red


"----------------------
" sytntax check on write
"----------------------
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
