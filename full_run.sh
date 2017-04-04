#!/bin/sh

TODO=$(tail +7 Makefile | grep : | sed -e 's/ ://')

echo '' > res.tsv

for i in $TODO ; do
make $i
T=$(./Run_test.sh 50 500 20 865  )
echo $i"	"$T >> res.tsv
done

