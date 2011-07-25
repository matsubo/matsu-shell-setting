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

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
filetype plugin on
