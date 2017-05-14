#!/bin/sh

#SET RUN PARAM HERE

META=27
WARM=1000
NB_RUN=40
DATA_SIZE=85

PLOT_ESTIMATE=false

MAQAO_PATH="../maqao"

function plot_tsv {
	for i in $(ls $1/*.tsv); do
		gnuplot -e "set terminal svg ; set output '$i.svg' ; plot '$i' with line"
	done
}

function plot_metaTime {
	echo - META ESTIMATE PLOT -
	
	for i in $(seq 4 50) ; do
		med=$(mktemp)

		echo '' > $med	

		for j in $(seq 0 $i) ; do
			T=$(taskset -c 3 ref_O3 ${WARM} ${NB_RUN} ${DATA_SIZE})
			echo $T >> $med
		done
	
		echo - RESULT WRITING FOR $i -

		z=$(sort -n $med | sed -ne "$(($i/2+1))p")
	
		echo $i"	"$z >> metamed.tsv
	done

	gnuplot -e "set terminal svg ; set output 'metamed.svg' ; plot 'metamed.tsv' with line"

}

function plot_NBRUN {

	echo - REP ESTIMATE PLOT -
	
	for i in $(seq 4 50) ; do
		med=$(mktemp)

		echo '' > $med	

		for j in $(seq 0 $META) ; do
			T=$(taskset -c 3 ref_O3 ${WARM} $i ${DATA_SIZE})
			echo $T >> $med
		done
	
		echo - RESULT WRITING FOR $i -

		z=$(sort -n $med | sed -ne "$(($i/2+1))p")
	
		echo $i"	"$z >> rep.tsv
	done

	gnuplot -e "set terminal svg ; set output 'rep.svg' ; plot 'rep.tsv' with line"



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
	
	med=$(mktemp)

	echo '' > $med	

	echo '' > "meta_plot/"$i".tsv"
	for j in $(seq 0 $META) ; do
		T=$(taskset -c 3 $i ${WARM} ${NB_RUN} ${DATA_SIZE})
		echo $T >> $med
		echo $j"	"$T >> "meta_plot/"$i".tsv"
	done
	
	echo - RESULT WRITING FOR $i -

	z=$(sort -n $med | sed -ne "$(($META/2+1))p")
	
	echo $i","$z >> res.csv

	echo - SLEEP -

	sleep 3
	
done

mv *.tsv warm_plot/


echo  - PLOTING -

if ${PLOT_ESTIMATE} ; then
	sleep 3
	plot_metaTime
	sleep 3
	plot_NBRUN
fi


plot_tsv warm_plot


plot_tsv meta_plot

echo - CQA PASS -

for i in $(ls bin/*) ; do
	$MAQAO_PATH cqa fct-loops=kernel conf=all -- $i> ${i//bin/cqa}.cqa
done

echo - DONE - 
