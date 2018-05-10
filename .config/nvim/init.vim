" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

filetype plugin indent on

let mapleader = ","
"let g:maplocalleader = 'm'

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set shiftround
set autoindent
set smartindent

set ignorecase
set smartcase
set hlsearch
set nowrapscan
set incsearch

set noswapfile
set nobackup
set noundofile

"set showmatch
"set matchtime=1
set matchpairs& matchpairs+=<:>

set list
"set listchars=tab:>-,trail:-,eol:$,extends:>,precedes:<,nbsp:%
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

set wildmenu
set wildmode=longest:list,full

set splitright
set splitbelow

set clipboard=unnamed

set pastetoggle=<Leader>p

" <C-[> も <Esc> とする
"inoremap <C-[> <Esc>
"nnoremap <C-[> <Esc>

" insertモードから抜ける
inoremap <silent> jj <Esc>
inoremap <silent> <C-j> j

"" insertモードでもquit
"inoremap <C-q><C-q> <Esc>:wq<CR>
"" insertモードでもsave
"inoremap <C-w><C-w> <Esc>:w<Insert><CR>
"" insertモードでC-s -> Save, C-q -> Quit
"inoremap <C-s> <Esc>:w<CR>
"inoremap <C-q> <Esc>:q<CR>

" Esc->Escで検索結果とエラーハイライトをクリア
nnoremap <silent><Esc> :<C-u>nohlsearch<CR>

" 空行挿入
nnoremap ; :<C-u>call append(expand('.'), '')<Cr>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

nnoremap Q <Nop>

nnoremap j gj
nnoremap k gk

"vnoremap v $h

nnoremap <Tab> %
vnoremap <Tab> %

" バッファ切り替え
nnoremap <silent><C-n> :<C-u>bnext<CR>
nnoremap <silent><C-p> :<C-u>bprevious<CR>

" CTRL-hjklでウィンドウ間を移動(TODO: <C-l> 潰しちゃってる)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" TODO: Shift-hjklでウィンドウを移動
"nnoremap <S-h> <C-w>H
"nnoremap <S-j> <C-w>J
"nnoremap <S-k> <C-w>K
"nnoremap <S-l> <C-w>L

" Shift-矢印でウィンドウ幅を変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" Command-line mode keymappings:"{{{
" <C-a>, A: move to head.
cnoremap <C-a> <Home>
" <C-b>: previous char.
cnoremap <C-b> <Left>
" <C-d>: delete char.
cnoremap <C-d> <Del>
" <C-e>, E: move to end.
cnoremap <C-e> <End>
" <C-f>: next char.
cnoremap <C-f> <Right>
" <C-n>: next history.
cnoremap <C-n> <Down>
" <C-p>: previous history.
cnoremap <C-p> <Up>
" <C-y>: paste.
cnoremap <C-y> <C-r>*
" <C-g>: Exit.
cnoremap <C-g> <C-c>
"}}}

" カーソル下の単語をハイライト
nnoremap <silent> <Leader>h "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>

" ハイライトを消去して画面を再描画
nnoremap <silent> <Leader>l :<C-u>nohlsearch<CR><C-l>

" ヤンクした文字列でカーソル位置の単語を置換
"nnoremap <silent> cy  ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
"vnoremap <silent> cy  c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
"nnoremap <silent> ciy  ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

autocmd InsertLeave * set nopaste

" ファイルを開いた時に，カーソル位置を最後にカーソルがあった位置まで移動
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let g:python_host_prog = expand('$HOME/.anyenv/envs/pyenv/versions/neovim2/bin/python')
let g:python3_host_prog = expand('$HOME/.anyenv/envs/pyenv/versions/neovim3/bin/python')

let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME

" {{{ dein
if &compatible
  set nocompatible " Be iMproved
endif
let s:dein_dir = expand('$CACHE/dein')

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir
endif


" dein.vim settings

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:toml_dir = expand('$CONFIG/dein')

    call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}
