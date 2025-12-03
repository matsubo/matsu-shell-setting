Shell setting
================================

I'm a system architect and work as a programmer also. I'd like to publish my shell setting on github for effective coding.

Please subscribe RSS of my blog to keep track of open source development.
[https://matsu.teraren.com/blog/](https://blog.teraren.com/)


![image](https://blog.teraren.com/wp-content/uploads/2016/01/tty.gif)




Installation
---------------------------------

- Required for OS

macos
```
brew install git fzf fish rbenv ruby-build keychain ghq eza fd ripgrep git-delta vhs
```

ubuntu
```
sudo apt install -y git fzf rbenv ruby-build  keychain eza fd-find ripgrep

sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish -y

sudo apt install golang -y
go install github.com/motemen/ghq
go install github.com/koki-develop/gat@latest

set -U fish_user_paths ~/go/bin $fish_user_paths



sudo pip3 install powerline-status
sudo apt-get install fonts-powerline -y
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
ln -s ghq/github.com/matsubo/matsu-shell-setting/.tape
ln -s ghq/github.com/matsubo/matsu-shell-setting/Brewfile

mkdir -p .config/fish; cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/config.fish; cd
cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/fishfile; cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd
```

install fisher related setting
```
mkdir -p .config/fish; cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/config.fish; cd
cd .config/fish/; ln -s ~/ghq/github.com/matsubo/matsu-shell-setting/.config/fish/fishfile; cd
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install IlanCosman/tide@v6`
```

tide setting
```
tide configure --auto --style=Rainbow --prompt_colors='True color' --show_time='24-hour format' --rainbow_prompt_separators=Round --powerline_prompt_heads=Slanted --powerline_prompt_tails=Slanted --powerline_prompt_style='Two lines, character' --prompt_connection=Solid --powerline_right_prompt_frame=No --prompt_connection_andor_frame_color=Darkest --prompt_spacing=Sparse --icons='Few icons' --transient=No
```


Copy template setting and edit for local setting.
```
cp -n ghq/github.com/matsubo/matsu-shell-setting/.tigrc ./
cp -n ghq/github.com/matsubo/matsu-shell-setting/.gitconfig ./
```


Fisher plugin
```
fisher install jorgebucaran/fisher
fisher install oh-my-fish/theme-bobthefish
fisher install patrickf1/fzf.fish
fisher install jethrokuan/fzf
fisher install rstacruz/fish-asdf
```

Setup git property
```
git config --global user.name "Foo Bar"
git config --global user.email "foo@example.com"
```

Open tmux and press `prefix + I` to install tmux plugins by tmp.
`prefix + U` to update tmux plugins.


Copyright
---------------------------------

Createive Commons Attribution 3.0 Unported (CC BY 3.0)
* http://creativecommons.org/licenses/by/3.0/


