set number
" :set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=3
set mouse=a
set hidden 

syntax enable
filetype plugin indent on

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' "Retro Scheme
Plug 'ryanoasis/vim-devicons' " Developper Icons
Plug 'tc49cal/vim-terminal' " Vim Terminal
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'preservim/tagbar' " Tagbar for code navigation
" Plug 'neoclide/coc.nvim' " Auto Completion
" Plug 'rust-lang/rust.vim' " Rust Plugin
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
call plug#end()

nnoremap <F8> :TagbarToggle<CR>

set completeopt-=preview " For No Previews

colorscheme default

" Config like Emacs in Insert Mode
imap <C-f> <right>
imap <C-b> <left>
imap <C-p> <up>
imap <C-n> <down>
imap <C-a> <home>
imap <C-e> <end>

map <silent> <C-x><C-s> :w<Return>

" Config like Emacs in Normal/Visual Mode
map <C-a> <home>
map <C-e> <end>

" NeoVim
" Ctrl + g to Escape
map <C-g> <ESC>

" Increment/Decrement
nnoremap + <C-a>
nnoremap - <C-x>

" New tab
nmap <silent> te :tabedit<Return>

" Open file in new buffer
nmap <C-x><C-f> :e 

" Kill current buffer
nmap <C-x>k :close<Return>

" Show buffer list
nmap <silent> <C-x>b :ls<Return>

" Move between buffers
nmap <silent> <C-x>n :bNext<Return>
nmap <silent> <C-x>p :bprevious<Return>

" Split window
nmap <silent> ss :split<Return><C-w>w
nmap <silent> sv :vsplit<Return><C-w>w
nmap <silent> <C-x>2 :split<Return><C-w>w
nmap <silent> <C-x>3 :vsplit<Return><C-w>w

" Close current window
nmap <silent> <C-x>0 :close

" Close unactive window
nmap <silent> <C-x>1 <C-w>o

" Move between windows
nmap <C-x>o <C-w>w

" Resize window
nmap <C-r><C-b> <C-w><
nmap <C-r><C-f> <C-w>>
nmap <C-r><C-p> <C-w>+
nmap <C-r><C-n> <C-w>-

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>

" vim-lsp-settings
nnoremap <silent> gdf :LspDefinition<CR>
nnoremap <silent> gtd :LspTypeDefinition<CR>
nnoremap <silent> gim :LspImplementation<CR>
nnoremap <silent> gis :LspInstallServer<CR>
nnoremap <silent> grf :LspReferences<CR>
nnoremap <silent> grn :LspRename<CR>
nnoremap <silent> gfm :LspDocumentFormat<CR>

let g:lsp_diagnostics_enabled=1
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_text_edit_enabled=1
let g:asyncomplete_auto_popup=1
let g:asyncomplete_popup_delay=1

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:rustfmt_autosave = 1
