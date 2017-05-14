CC=gcc
FLAGS=-Wall -g
FILE=kernel.c main.c
NFILE=kernel_ref.c main.c
OUTDIR=bin/


Og : ${NFILE}
	${CC} -Og -Wall ${NFILE} -o ${OUTDIR}$@

O2 : ${NFILE}	
	${CC} -Og -Wall ${NFILE} -o ${OUTDIR}$@

O3_native : ${NFILE}
	${CC} ${FLAGS} -O3 -march=native ${NFILE} -o ${OUTDIR}$@

ref_O3 : ${NFILE}
	${CC} ${FLAGS} -O3  ${NFILE}  -o ${OUTDIR}$@

Ofast : ${NFILE}
	${CC} ${FLAGS} -Ofast ${NFILE} -o ${OUTDIR}$@

unsafe-math : ${NFILE}
	${CC} ${FLAGS} ${NFILE} -O3 -funsafe-math-optimizations -o ${OUTDIR}$@

fast-math : ${NFILE}	
	${CC} ${FLAGS} ${NFILE} -O3 -ffast-math -o ${OUTDIR}$@

rename-register : ${NFILE}	
	${CC} ${FLAGS} ${NFILE} -O3 -frename-registers -o ${OUTDIR}$@

icc-O2 : ${NFILE}	
	icc -O2 -w -g ${NFILE} -o ${OUTDIR}$@

icc-O3_xHost : ${NFILE}	
	icc -O3 -xHost -w -g ${NFILE} -o ${OUTDIR}$@

icc-O3 : ${NFILE}	
	icc -O3 -w -g ${NFILE} -o ${OUTDIR}$@

icc-Ofast : ${NFILE}	
	icc -Ofast -w -g ${NFILE} -o ${OUTDIR}$@

opti : ${FILE}
	${CC} ${FLAGS} -O3 ${FILE} -o ${OUTDIR}$@

opti-OnlyInv :
	${CC} ${FLAGS} -O3 main.c kernel_invOnly.c -o ${OUTDIR}$@

opti-arch : ${FILE}
	${CC} ${FLAGS} -O3 ${FILE} -march=native -o ${OUTDIR}$@

opti-icc : ${FILE}
	icc -g -Ofast -xHost ${FILE} -o ${OUTDIR}$@


