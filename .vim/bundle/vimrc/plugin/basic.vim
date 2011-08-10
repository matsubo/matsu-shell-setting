set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
"set mouse=a
"set ttymouse=xterm2

syntax on

" Changing PHP comment color
" hi Comment ctermfg=2

" insert spaces instead of tabs
"set expandtab
"set softtabstop=2
set tabstop=2

" insert appropriate tab with 1 tab key. but it's not smart...
" set smarttab
set autoindent
set cindent
set shiftwidth=2


" always show status line
set laststatus=2

" search behaviors
set ignorecase

" if the search word includes upper case, checks the case
set smartcase

" show line number
set number

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

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" folding
" set fdm=marker


set hlsearch


" disable auto comment out after the line break
set formatoptions-=ro

" http://www.ispern.com/?p=324
"新しい行を作ったときに高度な自動インデントを行う
" set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
" set smarttab

" http://winterdom.com/2008/08/molokaiforvim

set bg=dark

set t_Co=256
let g:molokai_original=1
colorscheme molokai

" show line number
set number ruler


set backspace=indent,eol,start

" vim-ref setting
let g:ref_phpmanual_path = $HOME . '/.setting/php/php-chunked-xhtml'
" let g:ref_phpmanual_cmd = 'w3m -dump %s'


" :highlight Underlined ctermfg=Cyan


""" unite.vim
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

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q




