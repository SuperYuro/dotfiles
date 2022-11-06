" Base configration

scriptencoding='utf-8'
set fileencoding='utf-8'

set number

set title
set hlsearch
set nobackup
set showcmd
set cmdheight=1
set laststatus=2
set expandtab
set scrolloff=10
set shell=zsh
set backupskip=/etc/*,/usr/bin/*,/usr/share/*,/usr/src/*,/bin/*
set inccommand=split
set ignorecase
set smarttab
set breakindent
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set wrap
set backspace=start,eol,indent

" Highlighting
set cursorline
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark

" Keymaps
" Emacs-like keymaps in Insert Mode
inoremap <C-a> <home>
inoremap <C-e> <end>

inoremap <C-f> <right>
inoremap <M-f> <C-right>
inoremap <C-b> <left>
inoremap <M-b> <C-left>

inoremap <C-p> <up>
inoremap <C-n> <down>

" Don't yank with x
nnoremap x "_x

" Crush macro shortcut
nnoremap <silent> q :w<CR>

" Redo with Shift+u
nnoremap U <C-r>

" Increment/Decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Tabs
nnoremap <silent> te :tabedit<CR>

nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>

" Buffers
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Windows
nnoremap <silent> ss :split<CR><C-w>w
nnoremap <silent> sv :vsplit<CR><C-w>w

nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

tnoremap <Esc> <C-\><C-n>
