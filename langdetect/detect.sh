#!/bin/bash

if [ ! $(command -v python3) ]
then
  echo Python 3 is needed
  exit 1 
fi

if [ $(command -v pip3) ]
then
  pip3 install -r requirements.txt
else
  echo Pip3 is needed to install dependencies
  exit 1
fi

if [ ! -f "queries.tmp" ]
then
  cp ../src/queries ./queries.tmp
fi

while IFS= read -r line
do
  lang=$(echo $line | ./detect.py)
  if [ ! -d ../src/lang/"$lang"/ ]
  then
    mkdir ../src/lang/"$lang"/
  fi
  echo $line >> ../src/lang/"$lang"/"$lang"
  tail -n +2 ./queries.tmp > ./.queries.tmp && mv ./.queries.tmp ./queries.tmp
done < ./queries.tmp