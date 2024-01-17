Shell setting
================================

I'm a system architect and work as a programmer also. I'd like to publish my shell setting on github for effective coding.

Please subscribe RSS of my blog to keep track of open source development.
[https://matsu.teraren.com/blog/](https://matsu.teraren.com/blog/)


![image](https://matsu.teraren.com/blog/wp-content/uploads/2016/01/tty.gif)




Installation
---------------------------------

- Required for OS

macos
```
brew install git fzf fish rbenv ruby-build keychain ghq eza fd ripgrep git-delta
```

ubuntu
```
sudo apt install -y git fzf rbenv ruby-build  keychain exa fd-find ripgrep

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish -y

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go-1.13
/usr/lib/go-1.13/bin/go get github.com/motemen/ghq
set -U fish_user_paths ~/go/bin $fish_user_paths

sudo pip3 install powerline-status
sudo apt-get install fonts-powerline
```


Get this repository and make symbolic links. This instruction is written for [fish](https://fishshell.com/).
```
ghq get git@github.com:matsubo/matsu-shell-setting.git
cd
ln -s ghq/github.com/matsubo/matsu-shell-setting/.htoprc
ln -s ghq/github.com/matsubo/matsu-shell-setting/.vim
ln -s ghq/github.com/matsubo/matsu-shell-setting/.vimrc
ln -s ghq/github.com/matsubo/matsu-shell-setting/.gvimrc
ln -s ghq/github.com/matsubo/matsu-shell-setting/.my.cnf
ln -s ghq/github.com/matsubo/matsu-shell-setting/.lv
ln -s ghq/github.com/matsubo/matsu-shell-setting/.w3m
ln -s ghq/github.com/matsubo/matsu-shell-setting/.tmux.conf
ln -s ghq/github.com/matsubo/matsu-shell-setting/.gitignore
ln -s ghq/github.com/matsubo/matsu-shell-setting/.gitattributes_global
ln -s ghq/github.com/matsubo/matsu-shell-setting/.git_commit_template
ln -s ghq/github.com/matsubo/matsu-shell-setting/.gemrc
ln -s ghq/github.com/matsubo/matsu-shell-setting/.bundle
ln -s ghq/github.com/matsubo/matsu-shell-setting/.grcat
ln -s ghq/github.com/matsubo/matsu-shell-setting/.pryrc
ln -s ghq/github.com/matsubo/matsu-shell-setting/Brewfile
mkdir -p .config/fish; cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/config.fish; cd
cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/fishfile; cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd
```


Copy template setting and edit for local setting.
```
cp -n ghq/github.com/matsubo/matsu-shell-setting/.tigrc ./
cp -n ghq/github.com/matsubo/matsu-shell-setting/.gitconfig ./
```

Setup git property
```
git config --global user.name "Foo Bar"
git config --global user.email "foo@example.com"
```

Install dein on local machine.
```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```


Copyright
---------------------------------

Createive Commons Attribution 3.0 Unported (CC BY 3.0)
* http://creativecommons.org/licenses/by/3.0/


