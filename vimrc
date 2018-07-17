"Set up vundle
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" silence python
silent! py3 pass


" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
" Display
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
" Shortcuts
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'rking/ag.vim'
" Syntax
Plugin 'plasticboy/vim-markdown'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'w0rp/ale'
" Shit
" Plugin 'godlygeek/tabular'


call vundle#end()
filetype plugin indent on
" End vundle plugins
"

""""""""""""""""""""
" appearance
""""""""""""""""""""
" Set background to dark
set background=dark
" Use 256 colours for theme
let base16colorspace=256
" Set theme to base16
colorscheme base16-solarized-dark
" Hightlight cursor line
set cursorline
" Show ruler
set colorcolumn=81
" Show line numbers
set number
" Show command in status bar
set showcmd



""""""""""""""""""""
" behaviour
""""""""""""""""""""
" Normal backspace
set backspace=indent,eol,start
" No swap files
set noswapfile
" Set syntax on
syntax on
" Show cursor position at all times
set ruler
" Better redrawing
set lazyredraw
set ttyfast
" Set scroll of to 15 lines
set scrolloff=15
" Word wraps and line breaks
set wrap
" Break lines at break
set linebreak
" Better line break on 7.4
set breakindent
set regexpengine=1
" Better splitting
set splitbelow
set splitright


""""""""""""""""""""
" search
""""""""""""""""""""
" Search as you type
set incsearch
" Highlight search
set hlsearch
" Ignore case while searching
set ignorecase
set smartcase



""""""""""""""""""""
" indent
""""""""""""""""""""
" Enable smart indent
set smartindent
" Enable smart tabs
set smarttab
" Set tabs width to 2 spaces
set tabstop=2
" Set shift width to 2 spaces
set shiftwidth=2
" Set soft tabs to 2 spaces
set softtabstop=2
" Set expandtab
set expandtab



""""""""""""""""""""
" plugin settings
""""""""""""""""""""
" Enable smart indent
" Airline settings
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'base16_solarized'

" show ale in status
let g:airline#extensions#ale#enabled = 1

" Ignore files on ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules$|htmlcov$|venv',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

" tmuxline seperators
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}


" Better Netrw
let g:netrw_liststyle=3
map <leader>e :Explore<cr>

" Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1


" Auto load vimrc on save
augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" YouCompleteMe
let g:ycm_python_binary_path = '/usr/local/bin/python'
map <F3> :YcmCompleter GoTo<CR>

" Snippets dir
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mycoolsnippets"] 

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"
" " better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>""
set runtimepath+=~/.vim/ultisnips_rep

" delimitmate
let delimitMate_expand_cr = 1


""""""""""""""""""""
" keymaps
""""""""""""""""""""
" Set leader to space
let mapleader="\<Space>"

" remove ctrlp for insert
inoremap <C-p> <nop>

" Save 
nnoremap <Leader>w :w<CR>

" Close buffer
" nnoremap <Leader>q :w<CR>:bd<CR>
nnoremap <Leader>q :bp\|bd! #<CR>

" Close window
nnoremap <Leader>x <C-w>c

" Don't remove indent from #
inoremap # X<C-H>#

" Set buffer movement to ,o ,p
nmap <Leader>p :bnext<CR>
nmap <Leader>o :bprev<CR>
nmap <Leader>b :CtrlPBuffer<CR>

" Better split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

" ale movements
nmap <Leader>an :ALENext<CR>
nmap <Leader>ap :ALEPrevious<CR>
nmap <Leader>aa :ALEToggle<CR>

" replace selection with clipboard
vmap <Leader>v d"*P

" Esc with jk
imap jk <Esc>

" Clear search highligh on esc
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" Better line movement
nmap j gj
nmap k gk

" No arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <right> <nop>
nnoremap <left> <nop>

" fugative remaps
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gd :Gdiff<CR>
nmap <Leader>gr :Gread<CR>
nmap <Leader>gw :Gwrite<CR>

