# Shell setting

I'm a system architect and work as a programmer also. I'd like to publish my shell setting on github for effective coding.

Please subscribe RSS of my blog to keep track of open source development.
http://matsu.teraren.com/blog/


# Installation

<pre>
 git clone git@github.com:matsubo/matsu-shell-setting.git .setting
 cd
 ln -s .setting/.htoprc
 ln -s .setting/.screenrc
 ln -s .setting/.vim
 ln -s .setting/.vimrc
 ln -s .setting/.gvimrc
 ln -s .setting/.zshrc
 ln -s .setting/.my.cnf
 ln -s .setting/.lv
 ln -s .setting/.w3m
 cp .setting/.tigrc ./
 cp .setting/.gitconfig ./
 cd .setting
 git submodule init
 git submodule update
 vim
</pre>

(open vim and type :BundleInstall to retrieve plugins)


# Copyright

Createive Commons Attribution 3.0 Unported (CC BY 3.0)
* http://creativecommons.org/licenses/by/3.0/


thanks to:
* http://d.hatena.ne.jp/vimtaku/20110219



