set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
"set mouse=a
"set ttymouse=xterm2

syntax on

" Changing PHP comment color
hi Comment ctermfg=2

" insert spaces instead of tabs
set expandtab
set softtabstop=2
set tabstop=2

" search behaviors
set ignorecase

" if the search word includes upper case, checks the case
set smartcase

" show line number
set number


" カーソル行をハイライト
set cursorline
highlight CursorLine ctermbg=DarkGray


" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

autocmd FileType php set omnifunc=phpcomplete#CompletePHP


set hlsearch


" disable auto comment out after the line break
set formatoptions-=ro

" http://www.ispern.com/?p=324
"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

