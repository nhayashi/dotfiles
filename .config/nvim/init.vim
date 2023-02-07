scriptencoding utf-8
" augroup がセットされていない autocmd 全般用の augroup
" これをやっておかないと ReloadVimrc したときに困る．by Linda_pp
augroup MyAutoCmd
  autocmd!
augroup END

" TODO: .vimrc を読み込んでいる時点でもう要らないと思われる
if &compatible
  set nocompatible
endif

let g:python3_host_prog = expand('$HOME/.asdf/installs/python/3.10.9/bin/python')

""plug Scripts-----------------------------
"
"let s:plug_dir = expand('$HOME/.local/share/nvim/site/autoload/plug.vim')
"
"if &runtimepath !~# '/plug.vim'
"  " Auto Download
"  if !isdirectory(s:plug_dir)
"      call system('git clone https://github.com/junegunn/vim-plug.git ' . shellescape(s:plug_dir))
"  endif
"
"  execute 'set runtimepath^=' . s:plug_dir
"endif
"
"call plug#begin(s:plug_dir)
"call plug#end()
"
""End plug Scripts-------------------------


"dein Scripts-----------------------------

let s:dein_dir = expand('$HOME/.cache/dein')

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

  let s:toml_dir = expand('$HOME/.config/dein')

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

"-----------------------------------------------------------------------------
" Options
"

" シンタックスハイライト
syntax enable
" バックスペースでいろいろ消せる
set backspace=indent,eol,start
" バックアップファイルなし
set nobackup
" .viminfoファイル制限
set viminfo=!,'50,<1000,s100,\"50
" 履歴を1000件まで保存する
set history=1000
" 行番号を表示
set number
" カーソル位置を表示する
set ruler
" スクロール時の余白確保
"set scrolloff=2
" ファイルエンコーディングをutf-8優先
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,sjis,euc-jp
set fileformats=unix,mac,dos
" タブ幅
set showtabline=2
set expandtab       " タブをスペースに展開する
set tabstop=4       " 画面上のタブ幅
set shiftwidth=4    " インデント時に自動的に挿入されるタブ幅
set softtabstop=4   " キーボードで<Tab>キーを押したときに挿入される空白の量
set shiftround
set smarttab        " 行頭の余白内で<Tab>キーを押すとshiftwidthの数だけインデント．行頭以外ではtabstopの数だけ空白が挿入される．
" 改行時にコメントしない
set formatoptions-=ro
" 改行コードの自動認識
set fileformats=unix,mac,dos
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索にマッチしたすべてのテキストをハイライトさせる
set hlsearch
" \ の前置きが不要な very magic を使う
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set nowildmenu
set wildmode=list,full
" ビープ音をOFFにする
set vb t_vb =
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" IMを使う
set noimdisable
" コマンドラインでのIM無効化
set noimcmdline
" 入力中のコマンドをステータスに表示する
set showcmd
" 対応する括弧の行き来する時間の設定
set matchtime=3
" vimを開いた位置ではなくファイルのディレクトリ位置を起点にする
set browsedir=buffer
" 文字にアンチエイリアスをかける
if has('mac') && has('gui_running')
  set antialias
endif
" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread
" 辞書ファイルからの単語補間
set complete+=k
" 高速ターミナル接続を行う
set ttyfast
" {{{}}}で折りたたみ
set foldmethod=marker
" カーソル下の単語を help で調べる
set keywordprg=:help
" コマンド実行中は再描画しない
set lazyredraw
" マルチバイト文字があってもカーソルがずれないようにする
set ambiwidth=double
" 勝手に作られる系のファイルを一箇所にまとめる
"set directory=~/.vim/swp
"set undodir=~/.vim/undo
" クリップボードにコピー
"set clipboard+=unnamed
" Use true color
set termguicolors

"-----------------------------------------------------------------------------
" Util
"

" 保存時に行末のスペースを削除
augroup AutoDeleteTailSpace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//ge
augroup END

" 一定時間カーソルを移動しないとカーソルラインを表示
" （ただし，ウィンドウ移動時はなぜか切り替わらない）
" http://d.hatena.ne.jp/thinca/20090530/1243615055
augroup AutoCursorLine
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI,WinEnter * setlocal cursorline
augroup END

" insertモードから抜けるときにIMをOFFにする（GUI(MacVim)は自動的にやってくれる
" iminsert = 2にすると，insertモードに戻ったときに自動的にIMの状態が復元される
if !has("gui-running")
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

" :vimgrepでの検索後, QuickFixウィンドウを開く
augroup greopen
  autocmd!
  autocmd QuickfixCmdPost vimgrep cw
augroup END

" vimrcのリロード
command! ReloadVimrc source $MYVIMRC

" カーソル位置の復元
autocmd MyAutoCmd BufReadPost *
  \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Hack #202: 自動的にディレクトリを作成する
" http://vim-users.jp/2011/02/hack202/
autocmd MyAutoCmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
function! s:auto_mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
           \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
     " call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
     call mkdir(a:dir, 'p')
  endif
endfunction

" ファイルタイプを書き込み時に自動判別
autocmd MyAutoCmd BufWritePost
\ * if &l:filetype ==# '' || exists('b:ftdetect')
\ |   unlet! b:ftdetect
\ |   filetype detect
\ | endif

" git commit message のときは折りたたまない(diff で中途半端な折りたたみになりがち)
autocmd MyAutoCmd FileType gitcommit setlocal nofoldenable

" git のルートディレクトリを開く
function! s:git_root_dir()
  if (system('git rev-parse --is-inside-work-tree') == "true\n")
    let s:path = system('git rev-parse --show-cdup')
    return strpart(s:path, 0, strlen(s:path)-1) " 末尾改行削除
  else
    echoerr 'current directory is outside git working tree'
  endif
endfunction

"-----------------------------------------------------------------------------
" Keymap
"

" Nobody ever uses "Ex" mode, and it's annoying to leave
noremap Q <nop>

" :w1 と打ってしまうくせ防止
cabbrev q1 q!
cabbrev w1 w!
cabbrev wq1 wq!

" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j

" insertモードでもquit
inoremap <C-q><C-q> <Esc>:wq<CR>
" insertモードでもsave
inoremap <C-w><C-w> <Esc>:w<Insert><CR>
" insertモードでC-s -> Save, C-q -> Quit
inoremap <C-s> <Esc>:w<CR>
inoremap <C-q> <Esc>:q<CR>

" x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

" 表示行に沿って移動
nnoremap j gj
nnoremap k gk

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

" 選択範囲を連続でインデントする
vnoremap < <gv
vnoremap > >gv
vnoremap = =gv

" 検索後画面の中心に移動
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzz
nnoremap # *zvzz

" バッファ切り替え
nnoremap <silent><C-n>   :<C-u>bnext<CR>
nnoremap <silent><C-p>   :<C-u>bprevious<CR>

" Escで検索結果とエラーハイライトをクリア
nnoremap <silent><Esc> :<C-u>nohlsearch<CR>

" 空行挿入
"nnoremap ; :<C-u>call append(expand('.'), '')<CR>
nnoremap ; o<ESC>k

"-----------------------------------------------------------------------------
" FileType
"

set autoindent   " 自動でインデント
set cindent      " Cプログラムファイルの自動インデントを始める．これがあれば smartindent 要らない．
" softtabstopはTabキー押し下げ時の挿入される空白の量，0の��合はtabstopと同じ，BSにも影響する
set tabstop=2 shiftwidth=2 softtabstop=0
" ペースト時にインデントoffにするためのキー設定
set pastetoggle=<C-E>

" ファイルタイプの検索を有効にする
filetype plugin on
" そのファイルタイプにあわせたインデントを利用する
filetype indent on

augroup FileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead cpanfile set filetype=cpanfile
  autocmd BufNewFile,BufRead cpanfile set syntax=perl.cpanfile
  autocmd BufNewFile,BufRead ELBfile,EIPfile,Groupfile,IAMfile,Routefile setf ruby
  autocmd BufNewFile,BufRead *.PL,*.pl,*.t,*.psgi,*.perl,cpanfile setf perl
  autocmd BufNewFile,BufRead *.tx setfiletype xslate " from vim-xslate
  autocmd BufNewFile,BufRead Capfile,Thorfile set filetype=ruby
  autocmd BufNewFile,BufRead *.html if search('^; ') > 0 | set filetype=xslate | endif
  autocmd BufNewFile,BufRead *.hpp,*.cl setf cpp
  autocmd BufNewFile,BufRead *.cu,*.hcu setf cuda
  autocmd BufNewFile,BufRead *.aj setf java
  autocmd BufNewFile,BufRead *.jspx setf xhtml
  autocmd BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl setf tex
  autocmd BufNewFile,BufRead *.tt,*.tt2 setf tt2html
  autocmd BufNewFile,BufRead *.html setf tt2html
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} setf markdown
  autocmd BufNewFile,BufRead *.less setf less
  autocmd BufNewFile,BufRead *.coffee setf coffee
  autocmd BufNewFile,BufRead *.erb set filetype=eruby.html
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  autocmd BufRead,BufNewFile *.ts set filetype=typescript
augroup END

augroup IndentGroup
  autocmd!
  " インデント幅4
  " setlocal sw=4 sts=4 ts=4 et
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cuda       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 noet
  autocmd FileType groovy     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType hpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=4 sts=4 ts=4 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType rust       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType terraform  setlocal sw=4 sts=4 ts=4 et
  autocmd FileType tex        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType tt2        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType tt2html    setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=2 sts=2 ts=2 et

  autocmd FileType perl,cgi   compiler perl
  " ソースコード全体を整形
  autocmd FileType perl,cgi   nmap <buffer>,pt <ESC>:%! perltidy<CR>
  autocmd FileType perl,cgi   nmap <buffer>,ptv <ESC>:%'<, '>! perltidy<CR>
  " 選択された部分のソースコードを整形
  autocmd FileType python     setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType ruby       compiler ruby
augroup END
