set nocompatible
set hlsearch incsearch
set fileformat=unix encoding=utf-8

filetype on
syntax on

set hidden wrap
set autoindent copyindent
set ttyfast visualbell
set scrolloff=3
set laststatus=2
set smartindent
set smartcase infercase

set background=dark

" set foldcolumn=2 foldmethod=syntax " marker

"" Broken with :h
" au BufWinLeave * mkview
" au BufWinEnter * silent loadview

" K&R style ident
"set cinoptions=:0,p0,t0,(0,W4
"set cinwords=if,else,while,do,for,switch,case
"set formatoptions=tcqro
"set cindent

set title list number ruler showmode showcmd showmatch
set listchars=eol:•,tab:↦\ ,trail:»,extends:↷,precedes:↶

" colorscheme solarized

if filewritable(expand("~/.vim/backup")) != 2
   call system("mkdir $HOME/.vim/backup -p")
endif
set backup backupdir=$HOME/.vim/backup
set undolevels=10000

set wildmenu wildmode=full

if has("gui_running")
  set guioptions-=r guioptions-=T
  set lines=40 columns=80
  " set transp=3
  " hi normal guibg=black
endif
