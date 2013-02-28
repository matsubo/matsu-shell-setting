#!/bin/sh
# Official site
# http://zsh.sourceforge.net/Arc/source.html

sudo apt-get update
sudo apt-get install make gcc libncurses5-dev  bzip2 -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir
wget http://sourceforge.net/projects/zsh/files/zsh/5.0.0/zsh-5.0.0.tar.bz2
tar jxvf zsh-5.0.0.tar.bz2
cd zsh-5.0.0
./configure --enable-multibyte &&  make && sudo make install && rehash
