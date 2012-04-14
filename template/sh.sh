#!/bin/zsh
# -------------------------------------
# Usage: % command.sh
# Author: Yuki Matsukura <matsubokkuri@gmail.com>
# -------------------------------------

# to be strict syntax checker
set -e

# -------------------------------------
# Error handling
# -------------------------------------
# command
# if [ "$?"-ne 0]; then echo "command failed"; exit 1; fi
#   or
# command || { echo "command failed"; exit 1; }
#
# -------------------------------------
# * Handling passed parameter
# -------------------------------------
# if [ $1 -ne 0]; then echo "parameter is required"; exit 1; fi
# 
# -------------------------------------
# * Handling critical section
# -------------------------------------
# if [ ! -e $lockfile ]; then
#   trap "rm -f $lockfile; exit" INT TERM EXIT
#   touch $lockfile
#   critical-section
#   rm $lockfile
#   trap - INT TERM EXIT
# else
#   echo "critical-section is already running"
# fi


