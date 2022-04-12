:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

:syntax enable
:filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' "Retro Scheme
Plug 'ryanoasis/vim-devicons' " Developper Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'preservim/tagbar' " Tagbar for code navigation
" Plug 'neoclide/coc.nvim' " Auto Completion
Plug 'rust-lang/rust.vim' " Rust Plugin
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
call plug#end()

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme zellner

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

let g:lsp_diagnostics_enabled=1
let g:lsp_diagnostics_echo_cursor=1
let g:lsp_text_edit_enabled=1
let g:asyncomplete_auto_popup=1
let g:asyncomplete_popup_delay=10

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

let g:rustfmt_autosave = 1
