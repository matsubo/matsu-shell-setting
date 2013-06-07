#!/bin/sh

#sudo apt-get update
#sudo apt-get install  libncurses5-dev cmake build-essential -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir


sudo aptitude install libncursesw5-dev
git clone git://github.com/jonas/tig.git
cd tig
make clean
make configure
LIBS=-lncursesw ./configure
make
sudo make install


