" VIM setting
"
" """""""""""""""""""""""""
" NeoBundle setting
" """""""""""""""""""""""""
set nocompatible               " be iMproved
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" global
NeoBundle 'L9'
NeoBundle 'project.tar.gz'
NeoBundle 'FuzzyFinder'
" Bundle 'Highlight-UnMatched-Brackets'
NeoBundle 'vcscommand.vim'
NeoBundle 'gtags.vim'
NeoBundle 'ref.vim'
NeoBundle 'unite.vim'
NeoBundle 'Shougo/vimproc.git'
NeoBundle 'AutoComplPop'
"NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"NeoBundle 'colorizer'
NeoBundle 'quickrun.vim'
NeoBundle 'surround.vim'
NeoBundle 'vim-ruickrun.vim'


" colorscheme
NeoBundle 'molokai'
" NeoBundle 'altercation/vim-colors-solarized'


" git
NeoBundle 'fugitive.vim'
NeoBundle 'gitv'

" rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'rails.vim'


" php
NeoBundle 'PDV--phpDocumentor-for-Vim'

" svn
NeoBundle 'svndiff.vim'


NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'


" PSR
NeoBundle 'stephpy/vim-php-cs-fixer'


filetype plugin indent on

" """""""""""""""""""""""""
" global setting
" """""""""""""""""""""""""
set encoding=utf-8
set fileencoding=japan
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set ambiwidth=double
set wildmenu
"set mouse=a
"set ttymouse=xterm2


" Changing PHP comment color
" hi Comment ctermfg=2


" always show status line
set laststatus=2
set statusline=%F%<%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04v,%04l/%L][%p%%]%=%{fugitive#statusline()}

set hlsearch

" search behaviors
set ignorecase

" if the search word includes upper case, checks the case
set smartcase

" show match
set showmatch

" show line number
set number
set ruler

" show incomplete command
set sc

" inremental search
set incsearch

" show special chars
set list
set lcs=tab:\ \ ,trail:_,extends:\

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

" http://d.hatena.ne.jp/yuyarin/20100225/1267084794
set backupskip=/tmp/*,/private/tmp/*
set backup


" to be fast response
set ttyfast
set lazyredraw



"------ Syntax Check ------
" PHP Lint
autocmd BufWritePost *.php :call PHPLint()
function PHPLint()
	let result = system( &ft . ' -l ' . bufname(""))
	let headPart = strpart(result, 0, 16)
	if headPart != "No syntax errors"
		echo result
	endif
endfunction



syntax on

" """""""""""""""""""""""""
" hard tab
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



imap ,tn :tabnew



" """""""""""""""""""""""""
" PHP
" """""""""""""""""""""""""
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" disable auto comment out after the line break
" set formatoptions-=ro


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
colorscheme molokai
let g:molokai_original=1


" """""""""""""""""""""""""
" vim-ref
" """""""""""""""""""""""""
" vim-ref setting
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>

let g:ref_phpmanual_path = $HOME . '/.setting/php/php-chunked-xhtml'
" let g:ref_phpmanual_cmd = 'w3m -dump %s'


" :highlight Underlined ctermfg=Cyan

" """""""""""""""""""""""""
" shel script
"
" """""""""""""""""""""""""
autocmd BufNewFile *.sh  0r $HOME/.setting/template/sh.sh
autocmd BufNewFile *.php 0r $HOME/.setting/template/php.php
autocmd BufNewFile *.html 0r $HOME/.setting/template/html.html


" """""""""""""""""""""""""
" ファイルの前回閉じたときの場所を記憶してくれます。
" """""""""""""""""""""""""
if has("autocmd")
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line ("'\"") <= line("$") |
				\   exe "normal! g'\"" |
				\ endif
endif

" """""""""""""""""""""""""
" Syntax check
" """""""""""""""""""""""""
"------------------------------------------------------------------------------------"
" 各種プログラムで構文チェク(:make)をCtr+c Ctr+cで行えるようにする
" 表示されたQuickFixはウィンドウを移動しなくても
" :cn および :cp　で移動可能
"------------------------------------------------------------------------------------"
" Perl構文チェック
autocmd FileType perl compiler perl
autocmd FileType perl map <c-c><c-c> :make<cr> :cw<cr><cr>

" PHP構文チェック
au BufRead,BufNewFile *.php set makeprg=php\ -l\ %
au BufRead,BufNewFile *.php set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType php map <c-c><c-c> :make<cr> :cw<cr><cr>

" Ruby構文チェック
au BufRead,BufNewFile *.rb set makeprg=ruby\ -c\ %
au BufRead,BufNewFile *.rb set errorformat=%m\ in\ %f\ on\ line\ %l
autocmd FileType rb map <c-c><c-c> :make<cr> :cw<cr><cr>

" HTML構文チェック
autocmd FileType xhtml,html :compiler tidy
autocmd FileType xhtml,html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
autocmd FileType xhtml,html map <c-c><c-c> :make<cr> :cw<cr><cr>


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



" Powerline
let g:Powerline_symbols = 'fancy'

" move the search word to the center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

" escape vcscommand diff mode
nmap <Leader>dq :winc l<CR>:bw<CR>:diffoff<CR>


" grep結果をquick fixに表示刷る
au QuickfixCmdPost vimgrep cw

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

" gitv
autocmd FileType git :setlocal foldlevel=99



"for surround.vim
" [key map]
" 1 : <h1>|</h1>
" 2 : <h2>|</h2>
" 3 : <h3>|</h3>
" 4 : <h4>|</h4>
" 5 : <h5>|</h5>
" 6 : <h6>|</h6>
"
" p : <p>|</p>
" u : <ul>|</ul>
" o : <ol>|</ol>
" l : <li>|</li>
" a : <a href="">|</a>
" A : <a href="|"></a>
" i : <img src="|" alt="" />
" I : <img src="" alt"|" />
" d : <div>|</div>
" D : <div class="section">|</div>

autocmd FileType smarty let b:surround_101 = "{t}\r{/t}" " 101 = e
autocmd FileType smarty let b:surround_10f = "{t}\n\r\n{/t}" " 102 = f
map  ,tt ysse
map  ,tb ySSe


autocmd FileType php let g:surround_103 = "_('\r')"  " 103 = g
autocmd FileType php let g:surround_71 = "_(\"\r\")" " 71 = G



autocmd FileType html let b:surround_49  = "<h1>\r</h1>"
autocmd FileType html let b:surround_50  = "<h2>\r</h2>"
autocmd FileType html let b:surround_51  = "<h3>\r</h3>"
autocmd FileType html let b:surround_52  = "<h4>\r</h4>"
autocmd FileType html let b:surround_53  = "<h5>\r</h5>"
autocmd FileType html let b:surround_54  = "<h6>\r</h6>"

autocmd FileType html let b:surround_112 = "<p>\r</p>"
autocmd FileType html let b:surround_117 = "<ul>\r</ul>"
autocmd FileType html let b:surround_111 = "<ol>\r</ol>"
autocmd FileType html let b:surround_108 = "<li>\r</li>"
autocmd FileType html let b:surround_97  = "<a href=\"\">\r</a>"
autocmd FileType html let b:surround_65  = "<a href=\"\r\"></a>"
autocmd FileType html let b:surround_105 = "<img src=\"\r\" alt=\"\" />"
autocmd FileType html let b:surround_73  = "<img src=\"\" alt=\"\r\" />"
autocmd FileType html let b:surround_100 = "<div>\r</div>"
autocmd FileType html let b:surround_68  = "<div class=\"section\">\r</div>"


set foldmethod=marker


" NERD_tree
" Q. How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd vimenter * if !argc() | NERDTree | endif
" How can I close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



"----------------------------------------------------
"" PDV (PhpDocumenter for vim)
"----------------------------------------------------
inoremap <C-@> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-@> :call PhpDocSingle()<CR>
vnoremap <C-@> :call PhpDocRange()<CR> 


" After phpDoc standard
let g:pdv_cfg_CommentHead = "/**"
let g:pdv_cfg_Comment1 = " *"
let g:pdv_cfg_Commentn = " *"
let g:pdv_cfg_CommentTail = " */"
let g:pdv_cfg_CommentSingle = "//"

" Default values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = "$id:$"
let g:pdv_cfg_Author = "Yuki Matsukura <yuki.matsukura@gree.co.jp>"
let g:pdv_cfg_Copyright = "GREE, Inc."
let g:pdv_cfg_License = " "


