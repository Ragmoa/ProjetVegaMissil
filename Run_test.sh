#!/bin/sh

N=100
WARM=100
NB_RUN=20
TAILLE=100

if test -n $1 ; then N=$1 ; fi

k=$N

z=0.0 

while test $N -ne 0 ; do
	z=$(bc <<< $az" + "$(./vegaMissil ${WARM} ${NB_RUN} ${TAILLE} ))
	N=$(($N-1))
done

echo "Pour "$k" exec "$z
