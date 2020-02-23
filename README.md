Shell setting
================================

I'm a system architect and work as a programmer also. I'd like to publish my shell setting on github for effective coding.

Please subscribe RSS of my blog to keep track of open source development.
[http://matsu.teraren.com/blog/](http://matsu.teraren.com/blog/)


![image](http://matsu.teraren.com/blog/wp-content/uploads/2016/01/tty.gif)




Installation
---------------------------------

```
ghq get git@github.com:matsubo/matsu-shell-setting.git
cd
ln -s ghq/github.com/matsubo/matsu-shell-setting/.setting/.htoprc
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
ln -s .setting/.gitattributes_global
ln -s .setting/.gemrc
ln -s .setting/.bundle
ln -s .setting/.grcat
ln -s .setting/.pryrc
ln -s .setting/.tmuxinator
ln -s .setting/.tmux-powerlinerc
mkdir -p .config/fish && cd .config/fish/ && ln -s ~/.setting/.config/fish/config.fish; cd
cd .config/fish/ && ln -s ~/.setting/.config/fish/fishfile; cd
cp .setting/.tigrc ./
cp .setting/.gitconfig ./
cp .setting/.zshrc_local ./
cd .setting
```

iTerm2 setting
---

Download following color scheme and import in iTerm2's color preset.
- [https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors](https://github.com/altercation/solarized/blob/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors)


Copyright
---------------------------------

Createive Commons Attribution 3.0 Unported (CC BY 3.0)
* http://creativecommons.org/licenses/by/3.0/



