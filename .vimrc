
" Get Current Directory
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" ======================
" Vundle
" ======================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Project
Plugin 'kana/vim-fakeclip'
Plugin 'grep.vim'
Plugin 'ctrlpvim/ctrlp.vim'

"Autocomplete
Plugin 'valloric/youcompleteme'

"Code Helper
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'godlygeek/tabular.git'

"Window Management
Plugin 'scrooloose/nerdtree.git'
Plugin 'moll/vim-bbye'
Plugin 'fholgado/minibufexpl.vim'

"Tags
Plugin 'majutsushi/tagbar.git'
Plugin 'lukaszkorecki/CoffeeTags'

"Syntax Enhancement
Plugin 'scrooloose/syntastic'
Plugin 'python.vim--Vasiliev'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'pangloss/vim-javascript.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade.git'
Plugin 'python_fold'

"Appearance
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
call vundle#end()


" ======================
" Environmental Settings
" ======================

" Set Mapleader
let mapleader=","

" Sets how many lines of history VIM can remember
set history=500

" Line Control
set linebreak
set nocompatible

" Tab Page
set tabpagemax=9
set showtabline=0

" No sound on errors
set noerrorbells
set novisualbell
set t_vb =

" Show line number and ruler
set number
set ruler

" Status bar
set laststatus=2 " Always show the statusline
set wildmenu       " Enable command line completion

" Search
set hlsearch      " Highlight search things
set magic         " Set magic on, for regular expressions
set showmatch     " Show matching bracets when text indicator is over them
set matchtime=2 " How many tenths of a second to blink
set incsearch
set ignorecase
set smartcase

" Tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

" Show command keys in the status line
set showcmd

" Indent
set autoindent
set smartindent
set wrap

" Set to auto read when a file is changed from the outside
set autoread

" Smart Backspace
set backspace=indent,eol,start

" Have the mouse enabled all the time
set mouse=a

" No Backup
set nobackup
set nowritebackup
set noswapfile

" Omni Complete
set complete=.,w,b,k,t,i
set completeopt=menuone,menu,longest

" Code Folding
set foldmethod=indent
set foldlevel=99 " Default no folding



" ===========
" Multi-Bytes
" ===========
if has("multi_byte")
    set encoding=utf-8
    set fileencodings=utf-8,gbk,chinese,latin1
    set formatoptions+=mM
    set nobomb " No Unicode BOM

    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif



" ============
" Color Scheme
" ============
if has('syntax')
    if (has("gui_running"))
        set background=light
    else
        set background=dark
    endif
    let g:gruvbox_italic=0
    colorscheme gruvbox

    " Enable syntax highlight
    syntax on
endif

set colorcolumn=80
highlight ColorColumn guibg=slategrey
set t_Co=256

" Hightlight Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\|[^\t]\zs\t\+\|\t\zs \+/ " \zs sets start of match so only tabs highlighted

" Highlight the cursor
set cursorline cursorcolumn


" =========
" GUI
" =========
if has('gui_running')
    " Number of pixel lines to use between characters
    set linespace=2

    " Under Linux/Unix etc.
    if has("unix") && !has('mac')
        set guifont=Courier\ 10\ Pitch\ 11
    endif

    " Under the Mac(MacVim)
    if has("mac")
        " Set the font in MacVim
        set guifont=Monaco:h14

        " Windows size and transparency
        set lines=200 columns=240
        set transparency=2

        " Use Native Fullscreen of MacVim
        let s:lines=&lines
        let s:columns=&columns

        func! FullScreenEnter()
            set lines=999 columns=999
            set fullscreen
        endf

        func! FullScreenLeave()
            let &lines=s:lines
            let &columns=s:columns
            set nofullscreen
        endf

        func! FullScreenToggle()
            if &fullscreen
                call FullScreenLeave()
            else
                call FullScreenEnter()
            endif
        endf

        " Toggle to Fullscreen
        map <leader>ff :call FullScreenToggle()<CR>

        set guioptions-=m
        set guioptions-=T

        " Set input method off
        set imdisable
    endif
else
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif



" =========
" AutoCmd
" =========
if has("autocmd")
    filetype plugin indent on

    " Set fileformat to UNIX
    autocmd FileType php,javascript,uhtml,us,ejs,phtml,html,css,python,vim,vimwiki,jade,coffee set fileformat=unix

    " C++ Support
    "autocmd FileType cpp set tags+=~/.vim/tags/cpp
    set tags+=~/.vim/tags/cpp

    " Arduino Support
    autocmd BufRead,BufNewFile *.ino set filetype=c

    " Python Support
    autocmd FileType python set makeprg="python -u %"
    autocmd FileType python imap <silent> <buffer> . .<C-X><C-O>
    autocmd FileType python set tabstop=4 shiftwidth=4 softtabstop=4

    " JavaScript Support
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType tpl,uhtml,phtml,html,htm,javascript let g:javascript_enable_domhtmlcss=1

    " Jade Support
    autocmd BufRead,BufNewFile *.jade set filetype=jade syntax=jade

    " CoffeeScript Support
    autocmd BufRead,BufNewFile *.coffee set filetype=coffee syntax=coffee

    " PHP Support
    autocmd BufNewFile,BufRead *.php set filetype=php
    autocmd FileType php set omnifunc =phpcomplete#CompletePHP
    autocmd FileType php set tabstop=4 shiftwidth=4 softtabstop=4

    let php_sql_query=1
    let php_htmlInStrings=1

    " CSS3 Syntax Highlight
    autocmd BufRead,BufNewFile *.css set filetype=css syntax=css3

    " HTML Syntax Highlight
    autocmd BufNewFile,BufRead *.htm set filetype=html
    autocmd BufNewFile,BufRead *.html set filetype=html
    autocmd BufNewFile,BufRead *.uhtml set filetype=html
    autocmd BufNewFile,BufRead *.us set filetype=html
    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.phtml set filetype=html
    autocmd BufNewFile,BufRead *.tpl set filetype=html

    " Web Development Indentation
    autocmd FileType tpl,uhtml,phtml,html,htm,javascript,coffee,css set tabstop=2 shiftwidth=2 softtabstop=2

    " TypeScript
    autocmd BufNewFile,BufRead *.ts set filetype=typescript
    autocmd FileType typescript set tabstop=2 shiftwidth=2 softtabstop=2

endif



" =========
" Plugins
" =========

" Tagbar
map <silent><leader>b :TagbarToggle<CR>


" MiniBufExplorer
let g:miniBufExplMapWindowNavVim    = 0
let g:miniBufExplMapWindowNavArrows = 0
let g:miniBufExplMapCTabSwitchBufs  = 0
let g:miniBufExplModSelTarget       = 1


" Grep
let Grep_Default_Filelist = '*.cpp *.h *.cc *.c *.php *.js *.css *.html *.phtml *.py *.rb *.coffee'


" CtrlP
let g:ctrlp_map           = '<C-I>'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
set wildignore            +=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
map <C-i> :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 'ra'


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" =================
" Keyboard Bindings
" =================
set pastetoggle=<F6>
map <silent> <leader>T  :TagbarToggle<CR>
map <silent> <leader>f  :Rgrep<CR>
map <silent> <leader>n  :noh<CR>
map <silent> <leader>l  :set list!<CR>
map <silent> <leader>c  :%s/[\r \t]\+$//<CR>
map <silent> <leader>w  :w<CR>
map <silent> <leader>q  :qall<CR>
map <silent> <leader>fq  :qall!<CR>
map <silent> <leader>y  "+y
map <silent> <leader>p  "+p
map <silent> <leader>dd :Bdelete<CR>
map <silent> <leader>ee :Tabularize /=<CR>
map <silent> <leader>t :NERDTreeToggle<CR>
map <C-o> :NERDTreeFocus<CR>
map <C-p> :cp<CR>
map <C-n> :cn<CR>
"map <C-S-p> :lprevious<CR>
"map <C-S-n> :lnext<CR>
if has("mac")
    map h <C-w>h
    map l <C-w>l
    map j <C-w>j
    map k <C-w>k
else
    map <A-h> <C-w>h
    map <A-l> <C-w>l
    map <A-j> <C-w>j
    map <A-k> <C-w>k
endif
map <C-h> :bp<CR>
map <C-l> :bn<CR>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
