#!/bin/bash

if [ ! $(command -v nodejs) ] && [ ! $(command -v node) ]
then
  echo Nodejs is needed to run this script
  exit 1 
fi

if [ $(command -v yarn) ]
then
  yarn
elif [ $(command -v npm) ]
then
  npm i
else
  echo Yarn or NPM is needed to install dependencies
  exit 1
fi

if [ ! -f "queries.tmp" ]
then
  cp ../src/queries ./queries.tmp
fi

while IFS= read -r line
do
  lang=$(echo $line | ./node_modules/.bin/franc)
  if [ ! -d ../src/lang/"$lang"/ ]
  then
    mkdir ../src/lang/"$lang"/
  fi
  echo $line >> ../src/lang/"$lang"/"$lang"
  tail -n +2 ./queries.tmp > ./.queries.tmp && mv ./.queries.tmp ./queries.tmp
done < ./queries.tmp