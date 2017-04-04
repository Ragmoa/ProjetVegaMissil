#!/bin/sh

TODO=$(tail +7 Makefile | grep : | sed -e 's/ ://')

echo '' > resL1.tsv

for i in $TODO ; do
make $i
T=$(./Run_test.sh)
echo $i"	"$T >> resL1.tsv
done

