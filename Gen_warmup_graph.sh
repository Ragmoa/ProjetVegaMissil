#!/bin/bash

CACHE="L1:85 L2:238 L3:865 RAM:2120"

W=30000

for i in $CACHE ; do 
./vegaMissil $W 0 $(cut -f 2 -d : <<< $i)
./warmplot.sh
mv warmup.png warmup$(cut -f 1 -d : <<< $i).png
sleep 10
done 
