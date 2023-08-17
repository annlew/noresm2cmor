#!/usr/bin/env bash

version=$1

shift

for v in $@
do
    #echo  "$v: "
    #echo -n "$v: "
    dir=$(ls -d $v/*/*/g?/$version)
    for d in $dir
    do 
      #echo  "$d "
      if [ -d $d ]
      then
          ls -1 $d/*.nc | wc -l
      else
          echo "not found"
      fi
    done
done | column -t

