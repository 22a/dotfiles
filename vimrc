" let's get some things straight
let s:darwin = has('mac')

"----------------------
" Plugins
"----------------------
call plug#begin('~/.vim/plugged')

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" Syntax Highlighting
Plug 'benekastah/neomake'

" Wizard Autocompletion
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
if has('nvim')
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction
  Plug 'shougo/deoplete.nvim', { 'do': function('DoRemote') }
else
  Plug 'ajh17/VimCompletesMe'
end

" Snippets in your bippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'


" Text mangeling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'


" Languages
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'othree/html5.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'adimit/prolog.vim'
Plug 'dag/vim2hs'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'honza/dockerfile.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'vim-scripts/applescript.vim'


" junegunn 🙏
" register peeks
Plug 'junegunn/vim-peekaboo'
" fuzzy file search <C-p>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install'  } | Plug 'junegunn/fzf.vim'
" tranquil poetry mode
Plug 'junegunn/goyo.vim'
" target text AFTER a text object
Plug 'junegunn/vim-after-object'


" Movement Enhancements
" speedy navigation
Plug 'easymotion/vim-easymotion'
" Speedy left right
Plug 'unblevable/quick-scope'


" Vim is your home now
" a unix is a useful
Plug 'tpope/vim-eunuch'
" Directory exploration
Plug 'justinmk/vim-dirvish'
" Git swizzeling
Plug 'tpope/vim-fugitive'
" tpope is dispatching whiz
Plug 'tpope/vim-dispatch'

" forgive my wayward fingers
Plug 'EinfachToll/DidYouMean'


" Status Bar TODO: Consider moving to lightline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" visual indentation
Plug 'nathanaelkane/vim-indent-guides'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" open finder/terminal where current file lives
Plug 'justinmk/vim-gtfo'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'


call plug#end()


"----------------------
" General Wizardry
"----------------------
filetype off
syntax on

" better % skulduggery
runtime macros/matchit.vim

" civ4 victory by space-race
let mapleader = "\<Space>"

" people won't hire me if my commit messages and readmes are gibberish
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

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
" quickscope colors
let g:qs_first_occurrence_highlight_color = '#afff5f' " gui vim
let g:qs_first_occurrence_highlight_color = 155       " terminal vim
let g:qs_second_occurrence_highlight_color = '#5fffff'  " gui vim
let g:qs_second_occurrence_highlight_color = 81         " terminal vim

" 80 is a number
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'

" vim after object objects
autocmd VimEnter * call after_object#enable('=', ':', ';', '-', '#', ' ')

"----------------------
" Autocomplete
"----------------------
if has('nvim')
  let g:deoplete#enable_at_startup = 1

  " deoplete <Tab> completion:
  " If popup menu is visible, select and insert next item, else insert tab char
  imap <silent><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  smap <silent><expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

  " shift tab, select and insert the previous item, else <C-h>
  inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

end

" Snippet expansion
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"


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

" Move across wrapped lines like regular lines
" Go to the first non-blank character of a line
noremap 0 ^
" Just in case you need to go to the very beginning of a line
noremap ^ 0


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

hi IndentGuidesOdd  ctermbg=235
hi IndentGuidesEven ctermbg=236
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


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
" Typescript html string syntax highlighting
"----------------------
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces

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
