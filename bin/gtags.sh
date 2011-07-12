#!/bin/sh

# usage: gtags.sh /path/to/project/root

root=$1


ext_name_list=" *.php5 *.php *.tpl"


find_params=''
for ext_name in $ext_name_list; do
    if [ -z "$find_params" ]; then
        find_params="-name $ext_name"
    else
        find_params="$find_params -o -name $ext_name"
    fi
done

current_dir=`pwd`
cd $root
find $root -type f $find_params | gtags -v -f -
cd $current_dir

