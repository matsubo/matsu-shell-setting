#!/bin/sh

sudo apt-get update
sudo apt-get install  libncurses5-dev cmake build-essential -y

src_dir=~/archive/

if [ ! -d $src_dir ];then
  mkdir $src_dir
fi

cd $src_dir


wget https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz
tar xf libevent-2.0.21-stable.tar.gz
cd libevent-2.0.21-stable
./configure &&  make && sudo make install && rehash


git clone git://github.com/thewtex/tmux-mem-cpu-load.git
cd tmux-mem-cpu-load
cmake . &&  make && sudo make install 


wget 'http://downloads.sourceforge.net/project/tmux/tmux/tmux-1.7/tmux-1.7.tar.gz?r=http%3A%2F%2Ftmux.sourceforge.net%2F&ts=1362013437&use_mirror=jaist' -O tmux-1.7.tar.gz
tar xf tmux-1.7.tar.gz
cd tmux-1.7
./configure &&  make && sudo make install && rehash

