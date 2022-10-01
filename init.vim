set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=3
set mouse=n
set hidden
set background=dark

filetype plugin indent on
syntax enable

" Plugins
packadd vim-jetpack
call jetpack#begin('~/.config/nvim/plugins')
Jetpack 'tani/vim-jetpack', {'opt': 1}
Jetpack 'vim-airline/vim-airline'
Jetpack 'tpope/vim-commentary'
Jetpack 'ap/vim-css-color'
Jetpack 'prabirshrestha/asyncomplete.vim'
Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
Jetpack 'prabirshrestha/vim-lsp'
Jetpack 'mattn/vim-lsp-settings'
Jetpack 'mattn/vim-lsp-icons'
call jetpack#end()

" Configure cursor manipulatino like Emacsin Insert Mode
imap <C-f> <right>
imap <C-b> <left>
imap <C-p> <up>
imap <C-n> <down>
imap <C-a> <home>
imap <C-e> <end>

" Don't yank with x
nnoremap x "_x

" Increment/Decrement
nnoremap + <C-a>
nnoremap - <C-x>

" New tab
nnoremap <silent> te :tabedit<Return>

" Move tab
nnoremap tn gt
nnoremap tp gT

" Split window
nnoremap <silent> ss :split<Return>
nnoremap <silent> sv :vsplit<Return>

" Move window
nnoremap <Space> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" Resize window
nnoremap <C-r>h <C-w><
nnoremap <C-r>j <C-w>-
nnoremap <C-r>k <C-w>+
nnoremap <C-r>l <C-w>>

" Exit terminal insert mode with ESC
tnoremap <Esc> <C-\><C-n>

nnoremap gfm :LspDocumentFormat<Return>
nnoremap grn :LspRename<Return>

colorscheme default
