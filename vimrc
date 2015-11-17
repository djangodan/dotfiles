call pathogen#infect()

" Visual
set background=dark
let base16colorspace=256
colorscheme base16-default
set lazyredraw
set t_Co=256
set cursorline
set laststatus=2
set ruler
set number
syntax on

" Behaviour
set mouse=a
filetype indent plugin on
set nofoldenable
let g:vim_markdown_folding_disabled=1
set visualbell
set scrolloff=15

" Search
set ignorecase
set hlsearch!
set incsearch

" Indentation
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Word wraps and line breaks
set wrap
set linebreak

" Normal backspace
set backspace=indent,eol,start

" Set terminal title
set title

" vim file shit
set nobackup
set noswapfile
set hidden

" Show command in status bar
set showcmd

" Better line break on 7.4
set breakindent
set regexpengine=1

" Don't fold shit
set showmatch
set clipboard+=unnamed

" Better splitting
set splitbelow
set splitright

" Set scss files to use css
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

" Visual keymaps
" paste over selection
vmap  r "_dP

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'
command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]

" Ignore files on ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

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
