#!/bin/bash

# parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
parent_path=$( cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P )

if [ -z "$1" ]; then 
    echo "please specify a package"
    exit -1
fi

#echo $parent_path/repositories.list
while read line; do declare "$line"; done <"$parent_path/repositories.list"

typeset -n package=$1

if [ -z $package ]; then
    echo package "$1" is not defined
    exit -1
fi

tmp=/tmp/tmp_update_$1.deb

echo retrieving package $1 from $package
curl -L -o $tmp $package
sudo apt install $tmp
rm $tmp