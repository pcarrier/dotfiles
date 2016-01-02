set nocompatible

call plug#begin()
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go'
call plug#end()

filetype on
syntax on

set showcmd
set showmatch
set showmode
set ruler
set number
set formatoptions+=o
set expandtab
set modeline
set noerrorbells
set esckeys

set splitbelow
set splitright

set hlsearch
set ignorecase
set smartcase
set incsearch
set magic

nnoremap <silent> <leader>l :nohlsearch<CR><C-L>

nnoremap <leader>r :call NumberToggle()<cr>

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 0
let g:deoplete#sources#go = 'vim-go'
let g:airline_powerline_fonts=1

set list
set listchars=tab:▸\ ,eol:¬

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/
