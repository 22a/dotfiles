"----------------------
" Plugins
"----------------------
call plug#begin('~/.local/share/nvim/plugged')

" Git bits
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Wizard autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }

" snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" less keystrokes
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Linty lint
Plug 'neomake/neomake'

" Text swizzeling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" JS + Html unmangeling
Plug 'maksimr/vim-jsbeautify'

" Languages
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jceb/vim-orgmode'

" junegunn 🙏
" see contents of registers real quick
Plug 'junegunn/vim-peekaboo'
" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
" tranquil poetry mode
Plug 'junegunn/goyo.vim'

" pretty colours
Plug 'chriskempson/base16-vim'

" font icon yokeys
Plug 'ryanoasis/vim-devicons'

" highlight first occurrences for fFtT
Plug 'unblevable/quick-scope'

" Directory exploration
Plug 'justinmk/vim-dirvish'

" Status Bar + Buffer Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" visual indentation levels
Plug 'Yggdroot/indentLine'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" speed grep things
Plug 'mhinz/vim-grepper'

" hex colours inline
Plug 'chrisbra/Colorizer'

" numbered search matches
Plug 'henrik/vim-indexed-search'

call plug#end()


"----------------------
" General Wizardry
"----------------------
filetype off
syntax on

" Only highlight the first 200 columns, no more minified spookery
set synmaxcol=200

" better % skulduggery
runtime macros/matchit.vim

" spelling is hard
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" command line bits
set showcmd
set wildmenu
set wildmode=longest:list

" backspace everything
set backspace=indent,eol,start

" gutter
set relativenumber
set number

" cursor
set cursorline

" files
set nobackup
set noswapfile
set nowritebackup

" soft-tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent

" / is v powerful
set hlsearch
set incsearch
set ignorecase
set smartcase

" key repeat delay?
set ttimeoutlen=0

" shame
set noerrorbells
set visualbell

" scroll padding
set scrolloff=15
set sidescrolloff=15

" sane vim split directions
set splitright
set splitbelow

" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'


"----------------------
" Autocomplete
"----------------------
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" spelling is nice too
set complete+=kspell


"----------------------
" Snippets
"----------------------

" Snippet expansion
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"



"----------------------
" Linting
"----------------------
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']


"----------------------
" Key Bindings
"----------------------
" Cold turkey is best turkey, arrow keys are slow
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Ctrl-P for fzf
nnoremap <C-p> :FZF<CR>

" no EX mode thank you very much
nnoremap Q <NOP>

" easier split nav
map <C-h>  <C-w>h
map <C-j>  <C-w>j
map <C-k>  <C-w>k
map <C-l>  <C-w>l

" hide pesky hls
noremap <silent> <Esc> :noh<CR><Esc>

" swap 0 and ^, 0 goes to the first non-blank character of a line
noremap 0 ^
" in case you need to go to the very beginning of a line, make that ^
noremap ^ 0

" pls let me leave terminal :'(
tnoremap <Esc> <C-\><C-n>

" make the cursor play nice with wrapped lines
noremap <silent> k gk
noremap <silent> j gj

"----------------------
" Commands
"----------------------

" fingers are difficult, make all typos work
command! Wq wq
command! WQ wq
command! W w
command! Q q

" shorten the speed grep command
cnoreabbrev Rg GrepperRg

" beautify things quickly
command! Jsbeautify call JsBeautify()
command! Jsonbeautify call JsonBeautify()
command! Htmlbeautify call HtmlBeautify()
command! Cssbeautify call CSSBeautify()


"----------------------
" Leader Commands
"----------------------

" civ4 victory by space-race
let mapleader = "\<Space>"

" Easily make changes to vimrc
nnoremap <Leader>R :so ~/.config/nvim/init.vim<CR>
" Easily do plugin things
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

" Trim Leading WS
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" fast file rename
nnoremap <Leader>rf :call RenameFile()<cr>

"  yank to system clipboard without motion
nnoremap <Leader>y "+y
"  yank line to system clipboard
nnoremap <Leader>yl "+yy
"  yank file to system clipboard
nnoremap <Leader>yf gg"+yG
"  paste from system clipboard
nnoremap <Leader>p "+p

" Toggle cases
nnoremap <Leader>t g~
nnoremap <Leader>tc ~h
nnoremap <Leader>tiw g~iw
nnoremap <Leader>tl g~~

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" closing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" toggle indent visual lines
nnoremap <Leader>i :IndentLinesToggle<CR>

" no distractions mode
nnoremap <Leader>g :Goyo<CR>


"----------------------
" Colour Things
"----------------------

" true colours awwww yeeee
set termguicolors
colorscheme base16-spacemacs

" show filthy whitespace in red
highlight ExtraWhitespace guibg=red

" 80 is a number that people care about
set colorcolumn=80

" quickscope on fFtT only
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


"----------------------
" Buffers
"----------------------

" hop from file to file without saving
set hidden

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>


"----------------------
" Status Bar
"----------------------
set noshowmode " don't show the plain mode text when we have fancy
set laststatus=2
let g:airline_theme='murmur'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1


"----------------------
" Helpful Functions
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
