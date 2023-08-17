#!/bin/bash

CMOR_ROOT=$(cd $(dirname $0) && cd ../../.. && pwd)
# parse input parameters
source $CMOR_ROOT/workflow/cmorParse.sh

years1=(2015 $(seq 2020 10 2040) 2050)
years2=(2019 $(seq 2029 10 2049) 2059)

echo $cmoroutroot
echo $version
echo $expid


${CMOR_ROOT}/workflow/cmorCheck.sh -v=$version -e=$expid -m=$model -o=$cmoroutroot -yrs1="${years1[*]}" -yrs2="${years2[*]}"

