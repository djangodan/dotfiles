call pathogen#infect()

" Default vim stuff
filetype indent plugin on
syntax on
set mouse=a
" That bell is the worst sound. Shut it the fuck off.
set visualbell        
" Has to do with the status bar at the bottom. Check :help laststatus
set laststatus=2 
set ruler
set number
" Search
set ignorecase
set hlsearch!
set incsearch
" Colors
set background=dark
colorscheme solarized
set lazyredraw
set t_Co=256
" Indentation
set smartindent
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
" Scroll before bottom
set scrolloff=10
" Word wraps and line breaks
set wrap
set linebreak
" Show tabs
set nolist
" Normal backspace
set backspace=2
set backspace=indent,eol,start
" Always show status bar
set laststatus=2
" Set terminal title
set title
" vim file shit
set nobackup
set noswapfile
set hidden
" Show command in status bar
set showcmd
" Highlight cursor line
set cursorline
" Better lin break on 7.4
set breakindent
set regexpengine=1
" Don't fold shit
set nofoldenable
set showmatch
set clipboard+=unnamed
set splitbelow
set splitright

au FileType python setl sw=2 sts=2 et
autocmd BufNewFile,BufRead *.scss set ft=scss.css "Sets filetpe of scss to be css. Helps with plugins.

" Keymaps
let mapleader=","
" Toggle highlight search ctrl ]
:nnoremap <C-]> :set hlsearch!<CR>
" Close buffer ,w
nmap <Leader>w :bd<CR>
" Show tabs ctrl a
:nmap <C-A> :set list!<CR>
" Normal keymaps
nmap <CR> o<Esc>k
" Better split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
" Esc with ctrl [
:imap <C-[> <Esc>
" Better line movement
:nmap j gj
:nmap k gk
" Don't highlight search
:nmap \q :nohlsearch<CR>
" Lazy buffer movement ,xz
nmap \q :nohlsearch<CR>
nmap <Leader>x :bnext<CR>
nmap <Leader>z :bprev<CR>
" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>
" Removed word wrap ,r
:noremap <Leader>r :set nowrap! <CR>
" Auto complete {}
noremap <Leader>r :set nowrap! <CR>

" Insert keymaps
imap <C-[> <Esc>
:inoremap {<CR> {<CR>}<c-o>O

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]

" Ignore files on ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

"smart indent when entering insert mode with i on empty lines
function! IndentWithI()
if len(getline('.')) == 0
return "\"_ddO"
else
return "i"
endif
endfunction
nnoremap <expr> i IndentWithI()

set shell=/bin/bash

let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

:command Copyemail ! grunt build && cat index.html | pbcopy
set iskeyword+=- "Makes foo-bar considered one word
