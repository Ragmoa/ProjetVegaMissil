for i in $(ls plot/*.tsv); do
	gnuplot -e "set terminal svg ; set output '$i.svg' ; plot '$i' with line"
done
