set nocompatible
" display
"-----------------------------------------------------------
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set shortmess+=I

set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set display=uhex

set laststatus=2
set cmdheight=2
set showcmd
set title

set scrolloff=2

set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L

set nofoldenable

" colorschema
"-----------------------------------------------------------
colorscheme darkblue
set background=light
hi Comment ctermfg=darkcyan
hi PmenuSel ctermbg=blue

" search
"-----------------------------------------------------------
"set incsearch
set ignorecase
set smartcase
set wrapscan

" edit
"-----------------------------------------------------------
set autoindent
set cindent
set showmatch
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a
set wildmenu
set formatoptions+=mM
inoremap <C-d> <Del>

" brackets
"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
"inoremap <> <><LEFT>

" tab
"-----------------------------------------------------------
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
inoremap <C-Tab> <C-V><Tab>

" backup
"-----------------------------------------------------------
set backup
set backupdir=~/.vim/backup
set swapfile
set directory=~/.vim/swap
set viminfo+=n~/.vim/.viminfo

" key map
"-----------------------------------------------------------
" move at line
nnoremap j gj
nnoremap k gk

" input time
inoremap <Leader>date <C-R>=strftime('%A, %B %d, %Y')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>
inoremap <Leader>rdate <C-R>=strftime('%A, %B %d, %Y %H:%M')<CR>
"inoremap <Leader>w3cdtf <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>
inoremap <Leader>w3 <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

" search
vnoremap * "zy:let @/ = @z<CR>n

" perltidy
map ,pt <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>

" indent
map ,id <Esc>:%! indent<CR>
map ,idv <Esc>:'<,'>! indent<CR>

" bcpp
"map ,bc <Esc>:%! bcpp 2> /dev/null<CR>
"map ,bcv <Esc>: <,'>! bcpp 2> /dev/null<CR>

" ctags
map <C-c><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" putline
"-----------------------------------------------------------
"let putline_tw = 60

"inoremap <Leader>line <ESC>:call <SID>PutLine(putline_tw)<CR>A
"function! s:PutLine(len)
"  let plen = a:len - strlen(getline('.'))
"  if (plen > 0)
"    execute 'normal ' plen . 'A-'
"  endif
"endfunction

" utf-8
"-----------------------------------------------------------
"let &termencoding=&encoding
"set termencoding=utf-8
"set encoding=utf-8
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp-2,euc-jisx0213,euc-jp,cp932
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932

if &encoding == 'utf-8'
  set ambiwidth=double
endif

" format.vim
"-----------------------------------------------------------
let format_allow_over_tw = 0

" chalice
"set runtimepath+=$HOME/.vim/chalice
"noremap <F2> :call <SID>DoChalice()<CR>
"let chalice_preview = 0
"let chalice_columns = 120
"let chalice_exbrowser = 'openurl %URL% &'
"function s:DoChalice()
"  Chalice
"endfunction

" autodate
"-----------------------------------------------------------
let g:autodate_format = '%Y-%m-%d'
let g:autodate_keyword_pre = 'Last modified:'
let g:autodate_keyword_post = '$'

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent
  " indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " perl filetype
  autocmd BufNewFile,BufRead *.t setf perl
  autocmd BufNewFile,BufRead *.psgi setf perl

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

endif " has("autocmd")
