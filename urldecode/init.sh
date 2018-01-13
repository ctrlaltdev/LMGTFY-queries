#!/bin/bash
read -p "Where is the queries file? " file
if [ ! -r $file ]
  then
    echo Can\'t read the file you indicated, maybe it doesn\'t exist, maybe you suck at giving me a functional path.
    exit 1;
fi
cp $file ./.queries.tmp
lines=$(wc -l .queries.tmp | grep -o -P '[\d]+(?= .*)')

read -p "How many parts do you want? " parts
read -p "Which one do you want to run now? " runpart

partlines=$(expr $lines / $parts)
startrunpart=$(expr $partlines \* $runpart)
endrunpart=$(expr $startrunpart + $partlines)

tail -n +$startrunpart .queries.tmp > .queries.tmp.tmp && mv .queries.tmp.tmp .queries.tmp
head -$partlines .queries.tmp > .queries.tmp.tmp && mv .queries.tmp.tmp .queries.tmp
mv .queries.tmp queries
echo Done, you can now launch urldecode.sh