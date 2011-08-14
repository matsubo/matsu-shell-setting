" basic
" .vim/bundle/vimrc/plugin/basic.vim
"
" gui
" .vim/bundle/vimrc/plugin/gui.vim
"
" alias
" .vim/bundle/vimrc/plugin/mappings.vim
"
" plugin
" .vim/bundle/vimrc/plugin/plugins_vimrc.vim
"
" utility
" .vim/bundle/vimrc/plugin/util.vim
"


" """""""""""""""""""""""""
" Vundle setting
" """""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" global
Bundle 'project.tar.gz'
Bundle 'gmarik/vundle'
Bundle 'FuzzyFinder'
Bundle 'Highlight-UnMatched-Brackets'
Bundle 'vcscommand.vim'
Bundle 'gtags.vim'
Bundle 'ref.vim'
Bundle 'unite.vim'
Bundle 'AutoComplPop'
Bundle 'git://github.com/Shougo/neocomplcache.git'
Bundle 'L9'

" rails
Bundle 'vim-ruby/vim-ruby'
Bundle 'rails.vim'


" php
Bundle 'PDV--phpDocumentor-for-Vim'

filetype plugin indent on

" """""""""""""""""""""""""
" global setting
" """""""""""""""""""""""""
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set wildmenu
"set mouse=a
"set ttymouse=xterm2


" Changing PHP comment color
" hi Comment ctermfg=2


" always show status line
set laststatus=2
set hlsearch

" search behaviors
set ignorecase

" if the search word includes upper case, checks the case
set smartcase

" show line number
set number ruler

" show special chars
set list
set lcs=tab:>\ ,trail:_,extends:\
highlight SpecialKey cterm=NONE ctermfg=darkgray guifg=7
highlight JpSpace cterm=underline ctermfg=darkgray guifg=7
au BufRead,BufNew * match JpSpace /　/


" カーソル行をハイライト
set cursorline
highlight CursorLine ctermbg=DarkGray


" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black


set backspace=indent,eol,start


syntax on

" """""""""""""""""""""""""
" tab
" """""""""""""""""""""""""
" insert spaces instead of tabs
"set expandtab
"set softtabstop=2
set tabstop=2

" insert appropriate tab with 1 tab key. but it's not smart...
" set smarttab
set autoindent
set cindent
set shiftwidth=2




" """""""""""""""""""""""""
" PHP
" """""""""""""""""""""""""
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" disable auto comment out after the line break
set formatoptions-=ro

"新しい行を作ったときに高度な自動インデントを行う
" http://www.ispern.com/?p=324
" set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" set smarttab


" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1 
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'php' : $HOME.'/.setting/.vim/dict/php.dict',
            \ }


" """""""""""""""""""""""""
" Color setting
" """""""""""""""""""""""""
" http://winterdom.com/2008/08/molokaiforvim
set bg=dark
set t_Co=256
let g:molokai_original=1
colorscheme molokai




" """""""""""""""""""""""""
" vim-ref
" """""""""""""""""""""""""
" vim-ref setting
let g:ref_phpmanual_path = $HOME . '/.setting/php/php-chunked-xhtml'
" let g:ref_phpmanual_cmd = 'w3m -dump %s'


" :highlight Underlined ctermfg=Cyan


" """""""""""""""""""""""""
" unite.vim
" """""""""""""""""""""""""
" 入力モードで開始する
" let g:unite_enable_start_insert=1

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

call unite#set_buffer_name_option('default', 'ignorecase', 1)
call unite#set_buffer_name_option('default', 'smartcase', 1)


" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q




" move the search word to the center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>


"" gtags
map <C-g><C-g> :Gtags 
" map <C-i> :Gtags -f %<CR>
" code jump
map <C-j> :GtagsCursor<CR>
" for gtags file skip
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" vmap
" dump the variable.
:vmap st "zdiprint_r("<pre>".<C-R>z".</pre>");exit;<ESC>





