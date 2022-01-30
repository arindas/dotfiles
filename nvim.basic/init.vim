" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

Plug 'kaicataldo/material.vim', { 'branch': 'main' }

Plug 'bfrg/vim-cpp-modern'

Plug 'tpope/vim-sleuth'

Plug 'jiangmiao/auto-pairs'

Plug 'edkolev/tmuxline.vim'

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set number
" hide line numbers in terminal mode
autocmd TermOpen * setlocal nonumber norelativenumber

set cursorline
set cursorlineopt=number

set noshowmode
set hidden

set ts=4 sw=4

filetype indent on

set fcs=eob:\ 

set clipboard+=unnamedplus

set termguicolors     " enable true colors support

let g:material_theme_style = 'darker-community'
let g:material_terminal_italics = 0
colorscheme material


let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'gitbranch#name'
	\ },
	\ 'colorscheme': 'material_vim',
	\
\ }

let g:tmuxline_powerline_separators = 0
