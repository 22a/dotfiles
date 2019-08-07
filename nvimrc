"----------------------
" Plugins
"----------------------
call plug#begin('~/.local/share/nvim/plugged')

" Git bits
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Buffer Navigation
Plug 'troydm/easybuffer.vim'

" \"Auto\" complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" less keystrokes
Plug 'tpope/vim-endwise'

" Linty lint
Plug 'w0rp/ale'

" Text swizzeling
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" Typescript
Plug 'leafgarland/typescript-vim'

" HBS
Plug 'joukevandermaas/vim-ember-hbs'

" junegunn 🙏
" see contents of registers real quick
Plug 'junegunn/vim-peekaboo'
" fuzzy file search
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" tranquil poetry mode
Plug 'junegunn/goyo.vim'
" emoji, the blood of life
Plug 'junegunn/vim-emoji'

" pretty colours
Plug 'chriskempson/base16-vim'

" Directory exploration
Plug 'justinmk/vim-dirvish'

" Status Bar + Buffer Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" visual indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'

" numbered search matches
Plug 'henrik/vim-indexed-search'

" editor config
Plug 'editorconfig/editorconfig-vim'

call plug#end()


"----------------------
" General Wizardry
"----------------------
filetype off
syntax on

" no folding please
set nofoldenable

" better % skulduggery
runtime macros/matchit.vim

" Only highlight the first 120 columns, no more minified spookery
set synmaxcol=256

set mouse=a

autocmd! bufreadpost *.min.* syntax off

" spelling is hard
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" command line bits
set showcmd
set wildmenu
set wildmode=longest:list
set wildignorecase

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

" tabs, etc
set expandtab " spaces, not tabs !!!
set autoindent " have a go at auto indenting even when no filetype set
set tabstop=2 " represent tabs as 2 spaces
set shiftwidth=2  " tab key enters two spaces"
set softtabstop=2 " backspace deletes two spaces

" / searching
set hlsearch " highlight matches
set incsearch " incrementally show matches as we type
set ignorecase
set smartcase " if we've explicitly typed an uppercase, become case sensitive

" 0 delay between keys
set timeoutlen=1000 ttimeoutlen=0

" disable all bells
set vb t_vb=
set noerrorbells

" scroll padding
set scrolloff=15
set sidescrolloff=15

" sane vim split directions
set splitright
set splitbelow

" incremental command result display
" (show the result of :%s/foo/bar/g as we type it)
set inccommand=nosplit

" Default peekaboo window
let g:peekaboo_window = 'vertical botright 30new'

let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['viml=vim', 'bash=sh']


"----------------------
" Autocomplete
"----------------------

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-emmet',
  \ 'coc-pairs',
  \ 'coc-snippets',
  \ 'coc-lists',
  \ 'coc-git',
\ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <C-j> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <leader>rw <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" spelling is nice too
set complete+=kspell

set completeopt=longest,menuone,preview


"----------------------
" Linting
"----------------------
let g:ale_fixers = { 'javascript': ['prettier'], 'scss': ['prettier'] }
" Format on Save
let g:ale_fix_on_save = 1


"----------------------
" Key Bindings
"----------------------
" disable arrow keys in insert, normal, and visual mode
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Ctrl-P for fzf
nnoremap <C-p> :FZF<CR>

" hide fzf status bar (it only says \"FZF")
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" disable EX mode
nnoremap Q <NOP>

" easier split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" disable search highlighting with escape
noremap <silent> <Esc> :noh<CR><Esc>

" swap 0 and ^. 0 now goes to the first non-blank character of a line
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

" :wsudo to save files if we've accidentally opened them read only
command! Wsudo w !sudo tee %


"----------------------
" Leader Commands
"----------------------

" civ4 victory by space-race
" (use space key as leader)
let mapleader = "\<Space>"

" Easily reload vimrc
nnoremap <Leader>R :so ~/.config/nvim/init.vim<CR>
" Easily manage plugins
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

" sneaky snake to camel case
nnoremap <Leader>s :s#_\(\l\)#\u\1#g<CR>

" Trim Leading WS
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" fast file rename
nnoremap <Leader>rf :call RenameFile()<cr>

" fast edit nvim rc
nnoremap <Leader>rc :e ~/.config/nvim/init.vim<CR>

" ye, system clip pls
set clipboard=unnamed

" yank to system clipboard without motion
nnoremap <Leader>y "+y
" yank line to system clipboard
nnoremap <Leader>yl "+yy
" yank file to system clipboard
nnoremap <Leader>yf gg"+yG
" paste from system clipboard
nnoremap <Leader>p "+p

" Toggle cases
nnoremap <Leader>t g~
nnoremap <Leader>tc ~h
nnoremap <Leader>tW g~iw
nnoremap <Leader>tl g~~

" writing files is too slow
nnoremap <Leader>w :w<CR>

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" closing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" grepping
" open a fullscreen interactive grepping window
nnoremap <leader>g :Rg!<CR>
" open a small interactive grepping window
nnoremap <leader>G :Rg<CR>
" grep the current working dir for the current word under the cursor
nnoremap <leader>* :Rg <c-r>=expand("<cword>")<CR><CR>

" easy toggle wrap, spell, and paste
nnoremap <Leader>W :set wrap!<CR>
nnoremap <Leader>S :set spell!<CR>
nnoremap <Leader>P :set paste!<CR>
" easily toggle ALE fixing on write
nnoremap <Leader>F :call ToggleAleFixer()<CR>

"----------------------
" Colour :art:
"----------------------

" true colours awwww yeeee
set termguicolors
colorscheme base16-spacemacs

" show superfluous whitespace in white
highlight ExtraWhitespace guibg=white

" mart the 80th char on a line
" (because 80 is a number that people care about)
set colorcolumn=80

" indent guide colors
let g:indent_guides_auto_colors = 0
" base16 spacemacs bg is #1F2022, so I've just bumped up to #222426 and #242628
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#242628
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222426

"
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
set noshowmode " don't show the plain mode text (we use airline)
set laststatus=2
let g:airline_theme='base16_spacemacs'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''


"----------------------
" Helpful Functions
"----------------------
function! ToggleAleFixer()
  let g:ale_fix_on_save = get(g:, 'ale_fix_on_save', 0) ? 0 : 1
endfunc

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

function! s:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
