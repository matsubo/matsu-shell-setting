#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
import datetime
import time
import os
from stat import *
import commands
import fnmatch

# easy_install clint
from clint.textui import colored



def watch(dir, command, extension):
    timestamp = time.mktime(datetime.datetime.now().utctimetuple())
    while True:
        for root, dirnames, filenames in os.walk(dir):
            for filename in fnmatch.filter(filenames, '*.' + extension):
                file = os.path.join(root, filename)
                file_timestamp = os.stat(file)[ST_MTIME]
                if timestamp < file_timestamp:
                    timestamp = file_timestamp
                    print colored.yellow("CHANGED >> ") + filename
                    print(commands.getoutput(command))

def help():
    print(u'第一引数が監視対象のディレクトリです．')
    print(u'第二引数が監視下のファイルに変更があった場合に実行するコマンドです．')
    print(u'第三引数が拡張子')
    print(u'例: % dirwatch . \'phpunit\' \'php\'')
    print(u'例ではカレントディレクトリ内のファイルに変更があった場合にhelloと表示します．')

if __name__ == '__main__':
    # 引数足りない場合にヘルプを表示する．
    if 4 > len(sys.argv):
        help()
    else:
        watch(sys.argv[1], sys.argv[2], sys.argv[3])




