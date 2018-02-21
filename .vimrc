" vimrc に以下のように追記

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

" basic setting
syntax on
colorscheme molokai

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set ambiwidth=double
set wildmenu wildmode=list:full
set ignorecase
set smartcase
set number
set ruler
set modifiable
set cursorline

" rendering
set ttyfast
set lazyredraw

" editor
syntax enable
filetype plugin indent on
set autoindent
set cindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" airline setting
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 


" move the search word to the center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


" """""""""""""""""""""""""
" vim's tab shortcut
" """""""""""""""""""""""""
nnoremap [TABCMD]  <nop>
" nmap     <leader>t [TABCMD]
nmap     t [TABCMD]

nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>
nnoremap <silent> [TABCMD]t :<c-u>tabnew<cr>

" fugitive
" nnoremap [fugitive]  <Nop>
" nmap <space>g [fugitive]
" nnoremap <silent> [fugitive]s :Gstatus<CR><C-w>T
" nnoremap <silent> [fugitive]a :Gwrite<CR>
" nnoremap <silent> [fugitive]c :Gcommit-v<CR>
" nnoremap <silent> [fugitive]b :Gblame<CR>
" nnoremap <silent> [fugitive]d :Gdiff<CR>
" nnoremap <silent> [fugitive]m :Gmerge<CR>
" 
