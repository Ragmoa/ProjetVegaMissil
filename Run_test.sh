#!/bin/sh

N=100

if test -n $1 ; then N=$1 ; fi

k=$N

z=0.0 

while test $N -ne 0 ; do
	z=$(bc <<< $az" + "$(./vegaMissil))
	N=$(($N-1))
done

echo "Pour "$k" exec "$z
