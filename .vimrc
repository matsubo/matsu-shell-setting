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
" NeoBundle 'project.tar.gz'
" NeoBundle 'FuzzyFinder'
" Bundle 'Highlight-UnMatched-Brackets'
NeoBundleLazy 'vcscommand.vim'
NeoBundle 'gtags.vim'
NeoBundle 'ref.vim'
" NeoBundle 'Shougo/vimfiler.git'
NeoBundleLazy 'Shougo/vimproc.git'
NeoBundleLazy 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'surround.vim'


NeoBundleLazy 'git://github.com/aghareza/vim-gitgrep.git'

" git
NeoBundle 'fugitive.vim'
NeoBundleLazy 'gitv'

" rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ruby-matchit'
NeoBundleLazy 'tpope/vim-rails'
NeoBundleLazy 'tpope/vim-endwise'
NeoBundle 'ujihisa/unite-rake'
" NeoBundle 'basyura/unite-rails'





" php
NeoBundle 'PDV--phpDocumentor-for-Vim'

" svn
NeoBundleLazy 'svndiff.vim'


NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'

" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'scrooloose/nerdcommenter'


NeoBundleLazy "Shougo/vimshell.git"

" PSR
" NeoBundle 'stephpy/vim-php-cs-fixer'

NeoBundle 'git://github.com/watanabe0621/SmartyJump.git'
NeoBundle 'git://github.com/watanabe0621/aoi-jump.vim.git'


NeoBundle 'vim-scripts/phpfolding.vim'
augroup vimrc
   autocmd FileType phpunit EnableFastPHPFolds
augroup END


NeoBundle 'scrooloose/syntastic.git'


NeoBundle 'Shougo/neosnippet'


nnoremap <silent> <space>b :e#<CR>
nnoremap <silent> <space>ag :call AoiGrep()<CR>
nnoremap <silent> <space>am :call AoiModuleJump()<CR>
nnoremap <silent> <space>ap :call AoiProcessorJump()<CR>
nnoremap <silent> <space>ac :call AoiClientJump()<CR>
nnoremap <silent> <space>i :call SmartyJump()<CR>




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
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%


" set leader key
let mapleader = ","




highlight SpecialKey cterm=NONE ctermfg=darkgray guifg=7
highlight JpSpace cterm=underline ctermfg=darkgray guifg=7
au BufRead,BufNew * match JpSpace /　/



" カーソル行をハイライト
set cursorline
highlight CursorLine ctermbg=DarkGray


" {{{ highlight spaces in the end of lines
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" }}}


" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

" Backspace key works for
set backspace=indent,eol,start

" http://d.hatena.ne.jp/yuyarin/20100225/1267084794
set backupskip=/tmp/*,/private/tmp/*
"set backup


" to be fast response
set ttyfast
set lazyredraw



"------ Syntax Check ------
" PHP Lint
" autocmd BufWritePost *.php :call PHPLint()
" function PHPLint()
" 	let result = system( &ft . ' -l ' . bufname(""))
" 	let headPart = strpart(result, 0, 16)
" 	if headPart != "No syntax errors"
" 		echo result
" 	endif
" endfunction



syntax on

" """""""""""""""""""""""""
" hard tab
" """""""""""""""""""""""""
" insert appropriate tab with 1 tab key. but it's not smart...
" set smarttab
set autoindent
set cindent

" old coding style
" set shiftwidth=2
" or
" new coding style
set expandtab


set shiftwidth=4
set softtabstop=4
set tabstop=4




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


" save shortcut
noremap <Leader><Leader> :up<CR>


" scroll by hitting space
nnoremap <Space> jzz
nnoremap <S-Space> kzz

" Disable F1 key
noremap <F1> <Nop>



" file operation
nnoremap <silent> <leader>q :q<cr>


" {{{ autocomplete
NeoBundle 'AutoComplPop'
NeoBundle 'Shougo/neocomplcache.git'
"
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

" }}}
" {{{ Color setting
" colorscheme
NeoBundle 'molokai'
" NeoBundle 'altercation/vim-colors-solarized'



" http://winterdom.com/2008/08/molokaiforvim
set bg=dark
set t_Co=256
colorscheme molokai
let g:molokai_original=1
" }}}
" {{{ vim-ref
" vim-ref setting
nmap ,ra :<C-u>Ref alc<Space>
nmap ,rp :<C-u>Ref phpmanual<Space>

let g:ref_phpmanual_path = $HOME . '/.setting/php/php-chunked-xhtml'
" let g:ref_phpmanual_cmd = 'w3m -dump %s'
" }}}
" {{{ File template
autocmd BufNewFile *.sh  0r $HOME/.setting/template/sh.sh
autocmd BufNewFile *.php 0r $HOME/.setting/template/php.php
autocmd BufNewFile *.html 0r $HOME/.setting/template/html.html
" }}}
" {{{ remember last edited line
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif
" }}}

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


" {{{ unite.vim
NeoBundle 'unite.vim'
" 入力モードで開始する
let g:unite_enable_start_insert=1

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
" }}}

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

" grep結果をquick fixに表示刷る
au QuickfixCmdPost vimgrep cw


" sample
" :Grep test
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endif
endfunction




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
:vmap se "zdierror_log(print_r(<C-R>z,1));<ESC>

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
" autocmd vimenter * if !argc() | NERDTree | endif
" How can I close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif



function! PearErrorSnipet()
    let l:cursor_word  = expand("<cword>")

    let l:text = printf("if (PEAR::isError($err = $%s)) {", l:cursor_word)
    exe "norm! o" . l:text
    let l:text = "return $err;"
    exe "norm! o" . l:text
    let l:text = "}" 
    exe "norm! o" . l:text
endfunction
noremap <silent> <space>p :call PearErrorSnipet()<CR>




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
let g:pdv_cfg_Author = "Yuki Matsukura <yuki.matsukura@gree.net>"
let g:pdv_cfg_Copyright = "GREE, Inc."
let g:pdv_cfg_License = " "

" smarty jump
nnoremap <silent> <space>b :e#<CR>
nnoremap <silent> <space>i :call SmartyJump()<CR>


" Open .vimrc
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

" 「コピーした文字で、繰り返し上書きペーストしたい」
vnoremap <silent> <C-p> "0p<CR>

" カーソルの上または下に表示する最小限の行数
set scrolloff=10

" {{{ clipboard
" set clipboard+=unnamed
" }}}

" {{{ define macro
let @q="ddko @autohr Yuki Matsukura <yuki.matsukura@gree.net>"
" }}}

