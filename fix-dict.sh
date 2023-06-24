#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Need filename"
	exit 1
fi

filename=$1
filerandom=$filename.random

length=$(wc -l dict.csv | cut -d" " -f1)
half=$(($length / 2))

sort -R $filename > $filerandom

head -n $half $filerandom > half1.tmp
tail -n +$((half + 1)) $filerandom > half2.tmp

sed -i "s/\b\(.\)/\u\1/g" half1.tmp
cat half*.tmp > $filerandom

sort $filerandom > $filename

rm half*.tmp $filerandom
