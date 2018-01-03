#!/bin/bash

tar -czvf queries.raw.tar.gz queries
lines=$(wc -l queries | grep -o -P '.+(?= queries)')
for [ 0..${lines} ]
  do
    if [ "$(wc -l queries | grep -o -P '.+(?= queries)')" == "0" ]
      then
        echo Done
        exit 1;
    fi

    query=$(head -1 queries)
    querydecoded=$(python3 urldecode.py ${query})
    echo ${querydecoded} >> queries.decoded
    tail -n +2 queries > queries.tmp && mv queries.tmp queries
done
