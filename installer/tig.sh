#!/bin/sh

#sudo apt-get update
#sudo apt-get install  libncurses5-dev cmake build-essential -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir


git clone http://jonas.nitro.dk/tig/tig.git/
cd tig
sudo make install install-release-doc prefix=/usr/local/

