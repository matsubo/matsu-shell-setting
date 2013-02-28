#!/bin/sh

sudo apt-get update
sudo apt-get install mercurial libncurses5-dev -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir

hg clone https://vim.googlecode.com/hg/ vim
cd vim/src
./configure --enable-multibyte --enable-xim --enable-fontset --disable-selinux --with-features=huge
make
sudo make install



