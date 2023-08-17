#!/usr/bin/env bash

version=$1

shift

for v in $@
do
    echo  "$v: "
    #echo -n "$v: "
    dir=$(ls -d $v/*/*/g?/$version)
    echo  "$dir "
    if [ -d $dir ]
    then
        ls -1 $v/g?/$version/*.nc | wc -l
    else
        echo "not found"
    fi
done | column -t

