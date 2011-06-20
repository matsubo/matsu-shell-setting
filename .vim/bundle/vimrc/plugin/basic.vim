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

" colorscheme darkblue

set bg=dark

set t_Co=256
let g:molokai_original=1
colorscheme molokai

" show line number
set number ruler



" :highlight Underlined ctermfg=Cyan


