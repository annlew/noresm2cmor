#!/bin/bash

version=v20191108
expid=piControl
model=NorESM2-MM
years1=($(seq 1200 10 1290))
years2=($(seq 1209 10 1299))
years1+=($(seq 1300 10 1440) 1450 )
years2+=($(seq 1309 10 1449) 1450 )

if [ $(hostname -f |grep 'ipcc') ]
then
    wfroot=/scratch/NS9034K/noresm2cmor/workflow
else
    wfroot=~/noresm2cmor/workflow
fi
${wfroot}/cmorCheck.sh -v=$version -e=$expid -m=$model -yrs1="${years1[*]}" -yrs2="${years2[*]}"

