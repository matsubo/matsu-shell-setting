Shell setting
================================

I'm a system architect and work as a programmer also. I'd like to publish my shell setting on github for effective coding.

Please subscribe RSS of my blog to keep track of open source development.
http://matsu.teraren.com/blog/


Installation
---------------------------------

```
git clone git@github.com:matsubo/matsu-shell-setting.git .setting
cd
ln -s .setting/.htoprc
ln -s .setting/.vim
ln -s .setting/.vimrc
ln -s .setting/.gvimrc
ln -s .setting/.zshrc
ln -s .setting/.zshenv
ln -s .setting/.my.cnf
ln -s .setting/.lv
ln -s .setting/.w3m
ln -s .setting/.tmux-powerlinerc
ln -s .setting/.tmux.conf
ln -s .setting/.global_ignore
ln -s .setting/.aptanarc
ln -s .setting/.gitattributes_global
ln -s .setting/.gemrc
ln -s .setting/.bundle
ln -s .setting/.grcat
ln -s .setting/.pryrc
ln -s .setting/.gist
ln -s .setting/.tmuxinator
ln -s .antigen/repos/.zprezto .zprezto
cp .setting/.tigrc ./
cp .setting/.gitconfig ./
cp .setting/.zshrc_local ./
cd .setting
git submodule init
git submodule update
vim
```

(open vim and type `:NeoBundleInstall` to retrieve plugins)

iTerm2 setting
---

Download following color scheme and import in iTerm2's color preset.
- [https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors](https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors)


submoduleの更新方法
---------------------------------

```
git submodule foreach 'git pull origin master'
```


submoduleの削除方法
---------------------------------
* `.gitmodules`ファイルから該当する行を削除
* `.git/config`ファイルから該当する行を削除

```
% git rm --cached path/to/hoge
% git commit
```

* Updating all submodule repositories
```
% git submodule foreach 'git checkout master; git pull'
```


Copyright
---------------------------------

Createive Commons Attribution 3.0 Unported (CC BY 3.0)
* http://creativecommons.org/licenses/by/3.0/



