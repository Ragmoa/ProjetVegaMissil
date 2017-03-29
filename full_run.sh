#!/bin/sh

TODO=$(tail +7 Makefile | grep : | sed -e 's/ ://')

for i in $TODO ; do
make $i
./Run_test.sh
done

