" Set up vundle
set nocompatible
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Vundle Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
" Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" Plugin 'junegunn/goyo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'Raimondi/delimitMate'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


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
colorscheme base16-eighties
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
let g:airline_theme = 'base16_ocean'

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

" Set buffer movement to ,o ,p
nmap <Leader>p :bnext<CR>
nmap <Leader>o :bprev<CR>

" Better split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

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
nmap <C-g>s :Gstatus<CR>
nmap <C-g>c :Gcommit<CR>
nmap <C-g>d :Gdiff<CR>
nmap <C-g>r :Gread<CR>
nmap <C-g>w :Gwrite<CR>

