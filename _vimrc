set nocompatible               " be iMproved, required
set backspace=indent,eol,start " enable backspace function
syntax on		       " enable syntax highlighting
filetype off                   " required

set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

" let Vundle manage Vundle, required
"--------------------------------------------------------------------------
Plugin 'VundleVim/Vundle.vim'

" Color Scheme
"--------------------------------------------------------------------------
Plugin 'nanotech/jellybeans.vim'

"file browser
"------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

"comment/uncomment
"-----------------
Plugin 'scrooloose/nerdcommenter'

"Trailling whitespace
"------------------
Plugin 'ntpeters/vim-better-whitespace'

"automatic closing bracket(s), parenthesis(es), quote(s)
"-------------------------------------------------------
Plugin 'Raimondi/delimitMate'

"vim-airline
"Lean & mean status/tabline for vim that's light as air.
"-------------------------------------------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

"re-map the vim <leader> key
"---------------------------
let mapleader=","
let g:mapleader=","

"configuration running gvim
"--------------------------------------------------------------------------
if has("gui_running")
    set encoding=utf-8
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Monaco\ for\ Powerline:h10
    colorscheme jellybeans
endif

" Visual Configuration
"--------------------------------------------------------------------------
set laststatus=2		"show last status for vim-airline plugin
set nowrap			"disable text-wrapping
set number			"show line number
set numberwidth=4		"line number column width
set showmatch			" highlight matching bracket(s) / parenthesis(s)
set wildmenu			"show file(s) available for edit above command-block

"vim tab configuration
"---------------------
set tabstop=4       "4 space(s) in a single tab
set softtabstop=4   "make backspace delete 4 space(s) at once
set shiftwidth=4    "use with < and > for block indenting"
set expandtab       "use space(s) instead of tab(s)
set autoindent      "indent new lines the same as previous one

"vim tab-length exceptions
"-------------------------
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2

"vim syntax-highlight
"--------------------
au BufNewFile,BufRead *.html setlocal filetype=htmldjango
au BufNewFile,BufRead *.php setlocal filetype=php
au BufNewFile,BufRead *.css setlocal filetype=css
au BufNewFile,BufRead *.js setlocal filetype=javascript

"vim history configuration
"-------------------------
set backup                              "set nobackup files
set noswapfile                          "set no swap(*.~) file
set history=1000                        "set larger undo/redo memory
set undofile                            "set persistent history
set undoreload=1000                     "save the whole buffers for undo when reloading
set backupdir=$HOME/.vim/tmp/backup/    "set backup storage directory
set undodir=$HOME/.vim/tmp/undo/        "set history storage directory

"vim searching configuration(s)
"------------------------------
set ignorecase  "searching with non case-sensitve approach
set incsearch   "highlight matches while searching
set smartcase   "search smarter way

"reload vimrc when its saved
"---------------------------
autocmd! BufWritePost $HOME\\_vimrc source $HOME\\_vimrc

"key-map for tab(s) navigation
"-----------------------------
map tn  :tabn<CR>
map tp  :tabp<CR>

"copy/cut/paste into/from clipboard
"----------------------------------
map <leader>x +x
map <leader>y +y
map <leader>p +p

"moving windows cursor focus
"---------------------------
map <c-h> <c-w>h
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l

"disable arrow key(s) in normal mode
"-----------------------------------
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"disable arrow key(s) in insert mode
"-----------------------------------
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"plugin(s) configuration(s)
"--------------------------
let NERDTreeIgnore=['\.o$', '\.pyc$']   "filter file(s) that shown at nerdtree
let g:nerdtree_tabs_open_on_console_startup=1

map <F3> :NERDTreeToggle<CR>

"hide file with these extension(s)
"---------------------------------
set wildignore+=*.sw?
set wildignore+=*.bak,*.~
set wildignore+=*.luac
set wildignore+=*.jar
set wildignore+=*.pyc
set wildignore+=*.stats

let g:airline_powerline_fonts = 1
