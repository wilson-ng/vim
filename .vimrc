set nocompatible                "enable system-wide vimrc support from user(s) .vimrc
set backspace=indent,eol,start  "enable backspace function
syntax on                       "enable syntax highlighting
filetype off                    "required

"vundle configuration
"--------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"plugin manager
"--------------
Plugin 'gmarik/Vundle.vim'

"indent Line
"----------------
Plugin 'Yggdroot/indentLine'

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

"autocomplete youcompleteme
"--------------------------
Plugin 'Valloric/YouCompleteMe'

"snipmate plugins
"----------------
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"vim zen coding style
"--------------------
Plugin 'mattn/emmet-vim'

"color scheme(s)
"---------------
Plugin 'flazz/vim-colorschemes'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'joedicastro/vim-molokai256'
Plugin 'nanotech/jellybeans.vim'

"adding nginx syntax highlight
"-----------------------------
Plugin 'evanmiller/nginx-vim-syntax'

"css3 syntax highlight
"---------------------
Plugin 'hail2u/vim-css3-syntax'

"twig
"-----------------------
Plugin 'evidens/vim-twig'

"symfony
"----------------------
Plugin 'docteurklein/vim-symfony'

"command-t
"----------------------
Plugin 'wincent/command-t'

call vundle#end()               "required
filetype plugin indent on       "required

"function(s)
"-----------
function! MakeDirIfNotExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

"visual configuration(s)
"-----------------------
set t_Co=256                    "enable 256-color vim support
"colorscheme molokai256
colorscheme base

set laststatus=2                "show last status for vim-airline plugin
set nowrap                      "disable text-wrapping
set number                      "show line number
set numberwidth=4               "line number column width is 4 space(s)
set showmatch                   "highlight matching bracket(s) / parenthesis(es)
set wildmenu                    "show file(s) available for edit above command-block"

"hide file with these extension(s)
"---------------------------------
set wildignore+=*.sw?
set wildignore+=*.bak,*.~
set wildignore+=*.luac
set wildignore+=*.jar
set wildignore+=*.pyc
set wildignore+=*.stats

"re-map emmet-key
"----------------
let g:user_emmet_leader_key='<C-A>'
"re-map the vim <leader> key
"---------------------------
let mapleader=","
let g:mapleader=","

"re-map snippet key
"-------------------
imap <C-J> <esc>a<Plug>snipMateNextOrTrigger
smap <C-J> <Plug>snipMateNextOrTrigger

"filetype plugin on  "enable file detection and load its plugin file
"filetype indent on  "enable file detection and load its indent file

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
autocmd BufWritePre * StripWhitespace

"php autocomplete extended
"=========================
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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

"make the dir(s) if it isn't exists
"----------------------------------
silent! call MakeDirIfNotExists(&backupdir)
silent! call MakeDirIfNotExists(&undodir)

"vim searching configuration(s)
"------------------------------
set ignorecase  "searching with non case-sensitve approach
set incsearch   "highlight matches while searching
set smartcase   "search smarter way

"reload vimrc when its saved
"---------------------------
autocmd! BufWritePost ~/.vimrc source ~/.vimrc

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

map <F3> :NERDTreeToggle<CR>

"configuration running gvim
"--------------------------
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
    set guifont=Monaco\ 10
endif

"ruler 81
"----------------------------
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
let &colorcolumn="80,".join(range(120,999),",")

