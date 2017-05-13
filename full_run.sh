#!/bin/sh

#SET RUN PARAM HERE

META=40
WARM=''
NB_RUN=''
DATA_SIZE=''

MAQAO_PATH="../maqao"

function plot_tsv {
	for i in $(ls $1/*.tsv); do
		gnuplot -e "set terminal svg ; set output '$i.svg' ; plot '$i' with line"
	done
}

if test ! -d warm_plot ; then  mkdir warm_plot ; fi
if test ! -d meta_plot ; then  mkdir meta_plot ; fi
if test ! -d bin ; then  mkdir bin ; fi
if test ! -d cqa ; then  mkdir cqa ; fi

TODO=$(tail +7 Makefile | grep : | cut -d : -f 1)

PATH=$PATH":./bin"

echo '' > res.csv

echo - START TEST -

for i in $TODO ; do
	
	echo  - COMPIL $i -

	make $i

	echo - RUNNING $i -
	
	z='0.0' #Moyen d'exec
	echo '' > "meta_plot/"$i".tsv"
	for j in $(seq 0 $META) ; do
		T=$(taskset 3 $i ${WARM} ${NB_RUN} ${DATA_SIZE})
		z=$(bc <<< $z" + "$T)
		echo $j"	"$T >> "meta_plot/"$i".tsv"
	done
	
	echo - RESULT WRITING FOR $i -

	z=$(bc <<< $z" / "$META".0")
	
	echo $i","$z >> res.csv
	
done

mv *.tsv warm_plot/

echo  - PLOTING -

plot_tsv warm_plot

plot_tsv meta_plot

echo - CQA PASS -

for i in $(ls bin/*) ; do
	$MAQAO_PATH cqa fct-loops=kernel conf=all -- $i> ${i//bin/cqa}.cqa
done

echo - DONE - 
