#!/bin/sh

TODO=$(tail +7 Makefile | grep : | cut -d : -f 1)

echo '' > res.tsv

for i in $TODO ; do
make $i
T=$(bin/$i)
echo $i"	"$T >> res.tsv
done

