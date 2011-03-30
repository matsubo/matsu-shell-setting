" 基本的な設定はこちら
" .vim/bundle/vimrc/plugin/basic.vim
"
" GUI関連はこちら
" .vim/bundle/vimrc/plugin/gui.vim
"
" マッピングに関するものはこちら
" .vim/bundle/vimrc/plugin/mappings.vim
"
" プラグインとそのマッピングについてはこちら
" .vim/bundle/vimrc/plugin/plugins_vimrc.vim
"
" 独自関数や便利関数はこちら
" .vim/bundle/vimrc/plugin/util.vim

" pathogen.vim用
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
filetype plugin on
