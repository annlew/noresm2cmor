#!/bin/bash

source ../scripts/runcmor_single.sh

#version=v20190920
version=v20191108b

if [ $# -eq 1 ]
then
    version=$1
fi

# initialize
login0=false
login1=false
login2=false
login3=false

# set active
login0=true
login1=true
login2=true
login3=true


expid=omip1
model=NorESM2-LM
echo "--------------------"
echo "EXPID: $expid       "
echo "--------------------"

echo "                    "
echo "START CMOR..."
echo "                    "

if $login0
then
#----------------
# omip1
#----------------
#CaseName=NOIIAOC20TR_T62_tn14_20190628
#login0
years1=($(seq 1700 10 1790))
years2=($(seq 1709 10 1799))
#login1
years1+=($(seq 1800 10 1890))
years2+=($(seq 1809 10 1899))
#login2
years1+=($(seq 1900 10 1990))
years2+=($(seq 1909 10 1999))
#login3
years1+=($(seq 2000 10 2060) 2070)
years2+=($(seq 2009 10 2069) 2071)

runcmor -c=$CaseName -e=$expid -v=$version -r=$real -yrs1="${years1[*]}" -yrs2="${years2[*]}"
#---
fi
#---

wait
echo "         "
echo "CMOR DONE"
echo "~~~~~~~~~"

# PrePARE QC check, create links and update sha256sum
../scripts/cmorPost.sh -m=${model} -e=${expid} -v=${version} --verbose=false
