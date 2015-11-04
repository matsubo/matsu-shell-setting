" VIM setting
"
" {{{ NeoBundle basic setting

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


filetype off
filetype plugin indent off

" }}}

call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'


" vim useful functions
NeoBundle 'L9'

" NeoBundle 'project.tar.gz'
" NeoBundle 'FuzzyFinder'
" Bundle 'Highlight-UnMatched-Brackets'
" NeoBundle 'gtags.vim'
" NeoBundle 'Shougo/vimfiler.git'


NeoBundleLazy 'git://github.com/thinca/vim-quickrun.git'
" {{{ vcs
NeoBundle 'fugitive.vim'
NeoBundle 'gitv'
NeoBundleLazy 'svndiff.vim'
NeoBundleLazy 'git://github.com/aghareza/vim-gitgrep.git'
NeoBundleLazy 'vcscommand.vim'
" }}}
" {{{ rails
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'ruby-matchit'
NeoBundleLazy 'tpope/vim-endwise'

NeoBundle 'tpope/vim-rails'
NeoBundle 'romanvbabenko/rails.vim'


" NeoBundle 'ujihisa/unite-rake'
NeoBundle 'basyura/unite-rails'
" }}}
" {{{ phpdoc
NeoBundle 'git@github.com:vim-scripts/PDV--phpDocumentor-for-Vim.git'
NeoBundle 'ref.vim'
" }}}

" NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'scrooloose/nerdcommenter'

" {{{ visualstar
NeoBundleLazy "git://github.com/thinca/vim-visualstar.git"
" }}}

" {{{ occur
NeoBundleLazy "git://github.com/vim-scripts/occur.vim.git"
" }}}

" {{{ vimproc
NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \ 'windows' : 'make -f make_mingw32.mak',
            \ 'cygwin' : 'make -f make_cygwin.mak',
            \ 'mac' : 'make -f make_mac.mak',
            \ 'unix' : 'make -f make_unix.mak',
            \ },
            \ }
" }}}
NeoBundleLazy "Shougo/vimshell.git"
NeoBundleLazy "sjl/gundo.vim"
NeoBundleLazy "vim-scripts/ShowMultiBase.git"

" {{{ csv.vim
NeoBundleLazy "chrisbra/csv.vim.git"
" }}}
" {{{ phpfolding
" NeoBundle 'vim-scripts/phpfolding.vim'
" NeoBundle 'https://github.com/matsubo/phpfolding.vim'
" augroup vimrc
"    autocmd FileType phpunit EnableFastPHPFolds
" augroup END
" }}}

" {{{ vim-scripts/Mark
NeoBundleLazy "vim-scripts/Mark"
" }}}

NeoBundle 'git://github.com/vim-scripts/camelcasemotion.git'




" html5
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'


" github
NeoBundle 'rhysd/github-complete.vim'

" {{{ camelcasemotion
NeoBundle 'git://github.com/bkad/CamelCaseMotion.git'
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e
" }}}
" {{{ autocomplete
NeoBundle 'AutoComplPop'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

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

" 静的解析
NeoBundle 'scrooloose/syntastic'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" }}}


" {{{
NeoBundle 'AndrewRadev/switch.vim'
nnoremap + :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap - :Switch<cr>
" }}}

" {{{ end-wise
NeoBundle 'tpope/vim-endwise.git'
" }}}
" {{{
NeoBundle 'ruby-matchit'
" }}}
" {{{ airline
NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" }}}

NeoBundle 'hail2u/vim-css3-syntax'



" colorscheme
NeoBundle 'tomasr/molokai'
NeoBundle 'ujihisa/unite-colorscheme'


NeoBundle 'unite.vim'
NeoBundle 'basyura/unite-rails'


NeoBundle 'thinca/vim-ref'
NeoBundle 'taka84u9/vim-ref-ri'

call neobundle#end()

" {{{ plugin setting
" need to call after neobundle
filetype plugin on
filetype plugin indent on
" }}}
" {{{ colorscheme
" http://winterdom.com/2008/08/molokaiforvim
set bg=dark
set t_Co=256
colorscheme molokai
let g:molokai_original=1
" }}}
" {{{ global setting
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis
set ambiwidth=double
set wildmenu wildmode=list:full

" be improved
set nocompatible
" line wrap
set whichwrap=b,s,[,],<,>,~

" mouse mode
"set mouse=a
"set ttymouse=xterm2

" enable highligh when searching
set hlsearch

" Changing PHP comment color
" hi Comment ctermfg=2


" always show status line
set laststatus=2
set statusline=%F%<%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04v,%04l/%L][%p%%]%=%{fugitive#statusline()}

" search behaviors
set ignorecase

" if the search word includes upper case, checks the case
set smartcase

" show match
set showmatch
set matchtime=3 "showmatchの表示時間


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


set hidden  "ファイル変更中でも他のファイルを開けるようにする
" }}}


" set leader key
let mapleader=","


" set modifiable
set modifiable

highlight SpecialKey cterm=NONE ctermfg=darkgray
highlight JpSpace cterm=underline ctermfg=darkgray
au BufRead,BufNew * match JpSpace /　/



" カーソル行をハイライト
set cursorline
highlight CursorLine ctermbg=DarkGray


" {{{ highlight spaces in the end of lines
augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=#505050 ctermbg=none
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" }}}


" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END

" {{{ highlight setting
" }}}

" Backspace key works for
set backspace=start,indent,eol

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


set shiftwidth=2
set softtabstop=2
set tabstop=2




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


" {{{ vim-ref
let g:ref_open                    = 'split'
let g:ref_refe_cmd                = expand('~/.vim/ref/ruby-ref1.9.2/refe-1_9_2')

nnoremap rr :<C-U>Unite ref/refe     -default-action=split -input=
nnoremap ri :<C-U>Unite ref/ri       -default-action=split -input=

aug MyAutoCmd
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>KK :<C-U>Unite -no-start-insert ref/ri   -input=<C-R><C-W><CR>
  au FileType ruby,eruby,ruby.rspec nnoremap <silent><buffer>K  :<C-U>Unite -no-start-insert ref/refe -input=<C-R><C-W><CR>
aug END
"}}}
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


" move the search word to the center
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz


" grep結果をquick fixに表示刷る
au QuickfixCmdPost vimgrep cw


" sample
" :Grep test
command! -complete=file -nargs=+ Grep call s:grep([<f-args>])
function! s:grep(args)
    let target = len(a:args) > 1 ? join(a:args[1:]) : '**/*'
    execute 'vimgrep' '/' . a:args[0] . '/j ' . target
    if len(getqflist()) != 0 | copen | endiincogf
endfunction




"" gtags
" map <C-g><C-g> :Gtags
" " map <C-i> :Gtags -f %<CR>
" " code jump
" map <C-j> :GtagsCursor<CR>
" " for gtags file skip
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>

" vmap
" dump the variable.
:vmap st "zdiprint_r("<pre>".<C-R>z".</pre>");exit;<ESC>
:vmap se "zdierror_log(print_r(<C-R>z,1));<ESC>

" gitv
autocmd FileType git :setlocal foldlevel=99



set foldmethod=marker


" NERD_tree
" Q. How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd vimenter * if !argc() | NERDTree | endif
" How can I close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif




" {{{ PDV (PhpDocumenter for vim)
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
let g:pdv_cfg_Author = "Yuki Matsukura"
let g:pdv_cfg_License = " "


let g:pdv_cfg_php4always = 0
let g:pdv_cfg_php4guess = 0
" }}}

" smarty jump
nnoremap <silent> <space>b :e#<CR>
nnoremap <silent> <space>i :call SmartyJump()<CR>


" Open .vimrc
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

" 「コピーした文字で、繰り返し上書きペーストしたい」
vnoremap <silent> <C-p> "0p<CR>

" {{{ カーソルの上または下に表示する最小限の行数
set scrolloff=10
" }}}


" {{{ unite.vim
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
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>

  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}


" neosnippet "{{{
" snippetを保存するディレクトリを設定してください
" example
let s:default_snippet = neobundle#get_neobundle_dir() . '/neosnippet/autoload/neosnippet/snippets' " 本体に入っているsnippet
" let s:my_snippet = '~/snippet' " 自分のsnippet
" let g:neosnippet#snippets_directory = s:my_snippet
" let g:neosnippet#snippets_directory = s:default_snippet . ',' . s:my_snippet
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
" xmap <silent>o                    <Plug>(neosnippet_register_oneshot_snippet)
" }}}


NeoBundleCheck

