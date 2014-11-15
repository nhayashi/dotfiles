set ts=4
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<
set expandtab
set ignorecase
set smartcase
set incsearch
set hlsearch
"syntax on
"filetype on
au BufNewFile,BufRead *.psgi,*.perl,*.t,cpanfile set filetype=perl
" perltidy
map ,pt <Esc>:%! perltidy<CR>
map ,ptv <Esc>:'<,'>! perltidy<CR>

