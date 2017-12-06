#!/bin/bash

if [ ! -r hashes -o ! -w hashes ]
  then
    echo File hashes doesn\'t exist or is not readable or not writable
    exit 1;
fi

if [ "$(wc -l hashes | grep -o -P '.+(?= hashes)')" == "0" ]
  then
    echo No more hashes!
    exit 1;
fi

hash=$(head -1 hashes)
curl -v --silent http://bfy.tw/${hash} --stderr - | grep -o -P '(?<=q=).*(?=")' >> queries
tail -n +2 hashes > hashes.tmp && mv hashes.tmp hashes