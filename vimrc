call pathogen#infect()

"  Wrap gitcommit file types at the appropriate length "
filetype indent plugin on
" Syntax highlightins
syntax on
" Set ruler (bottom right)
set ruler
" Ignore case on search
set ignorecase
" Highlight all matches on search
set hlsearch!
" Set background
set background=dark
" Set color scheme
colorscheme Tomorrow-Night
set lazyredraw
set t_Co=256
" Set smartindent on
set smartindent
" Show line numbers
" set relativenumber
set number
" Set incremental searching
set incsearch
" Tab settings
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
" Scroll off
set scrolloff=10
" Set word wrap on
set wrap
" Backspace options
set backspace=2
set backspace=indent,eol,start
" Airline status bar
set laststatus=2
" Terminal title
set title
"no swp/backup
set nobackup
set noswapfile
" Show tabs
" set listchars=tab:--
" set list!
" Remap for emmet
let g:user_emmet_leader_key='<C-d>'

au FileType python setl sw=2 sts=2 et

" Latex word wraps
au BufRead,BufNewFile *.txt,*.tex set wrap linebreak nolist textwidth=0 wrapmargin=0

" Key Maps

" Leader mapping
let mapleader=","
" Autoreload
:nmap <Leader>sv :source $MYVIMRC
:nmap <Leader>v :e $MYVIMRC
" Hide hlsearch
:nnoremap <C-]> :set hlsearch!<CR>
" Show/hide tabs
:nmap <C-A> :set list!<CR>
" Better splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" Better emmet
" imap hh <C-y>,
" ctrl [ as esc
:imap <C-[> <Esc>
" Better navigation
:nmap j gj
:nmap k gk
" \q as no highlight search
:nmap \q :nohlsearch<CR>
" buffer navigation - ctrl n/p
:nmap <Leader>x :bnext<CR>
:nmap <Leader>z :bprev<CR>
" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
" NerdTree
:nmap <Leader>e :NERDTreeToggle<CR>
" Toggle linenumbers
nnoremap <Leader>l :set relativenumber!<CR>
" Close buffer
nmap <Leader>w :bd<CR>
