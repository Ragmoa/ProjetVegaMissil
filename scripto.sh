#!/bin/bash 

T=$(ls cqa/*)

for i in $T ; do
	for j in $T ; do
		if test ! -z "$(diff $i $j)" ; then
			echo "-> to test "$i" & "$j
		fi
	done
done 
