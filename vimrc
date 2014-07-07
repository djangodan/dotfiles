call pathogen#infect()

filetype indent plugin on
syntax on
set ruler
set ignorecase
set hlsearch!
set background=dark
colorscheme Tomorrow-Night
set lazyredraw
set t_Co=256
set smartindent
set number
set incsearch
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set scrolloff=10
set wrap
set linebreak
set nolist
set backspace=2
set backspace=indent,eol,start
set laststatus=2
set title
set nobackup
set noswapfile
set hidden
set showcmd
set cursorline
set showbreak=...

au FileType python setl sw=2 sts=2 et

" Keymaps
let mapleader=","
:nmap <Leader>sv :source $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
:nnoremap <C-]> :set hlsearch!<CR>
:nmap <C-A> :set list!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
:imap <C-[> <Esc>
:nmap j gj
:nmap k gk
:nmap \q :nohlsearch<CR>
:nmap <Leader>x :bnext<CR>
:nmap <Leader>z :bprev<CR>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
:nmap <Leader>e :NERDTreeToggle<CR>
nnoremap <Leader>l :set relativenumber!<CR>
nmap <Leader>w :bd<CR>
:noremap <Leader>r :set nowrap! <CR>
