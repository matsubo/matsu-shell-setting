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
set shiftwidth=1


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

" cannot past due to this?
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP

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



" :highlight Underlined ctermfg=Cyan

