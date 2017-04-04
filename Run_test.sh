#!/bin/sh

N=50
WARM=''
NB_RUN=''
TAILLE=''

z='0.0' 

if test $1 = "HELP" ; then 
	echo "Usage : /path/Run_script [META] [WARMUP] [REPEAT] [SIZE TAB]"
elif test ! -z $1 ; then N=$1 ; fi
if test ! -z $2 ; then WARM=$2 ; fi
if test ! -z $3 ; then NB_RUN=$3 ; fi
if test ! -z $4 ; then TAILLE=$4 ; fi

k=$N

echo "" > test

while test $N -ne 0; do
	T=$(./vegaMissil ${WARM} ${NB_RUN} ${TAILLE})
	z=$(bc <<< $z" + "$T)
	N=$(($N-1))
done

z=$(bc <<< $z" / "$k".0")

echo $z
