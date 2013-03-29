#!/bin/sh

# sudo apt-get update
# sudo apt-get install make gcc libncurses5-dev  bzip2 -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir
wget http://tamacom.com/global/global-6.2.8.tar.gz
tar xf global-6.2.8.tar.gz
cd global-6.2.8
./configure && make && sudo make install

