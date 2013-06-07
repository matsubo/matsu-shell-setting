#!/bin/sh

#sudo apt-get update
#sudo apt-get install  libncurses5-dev cmake build-essential -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir


sudo aptitude install autoconf zlib1g-dev libssl-dev gettext libcurl4-openssl-dev

git clone https://github.com/git/git.git
cd git
make configure
./configure --with-expat --with-curl
make
sudo make install

rehash


