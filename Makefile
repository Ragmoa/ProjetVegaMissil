CC=gcc
FLAGS=-O3 -Wall -g 
FILE=kernel.c main.c
FILE_N=-o vegaMissil
N=100

Og :
	${CC} -Og -Wall ${FILE} ${FILE_N}

ref :
	${CC} ${FLAGS} ${FILE} ${FILE_N}

Ofast :
	${CC} -Ofast -g ${FILE} ${FILE_N}

unsafe-math :
	${CC} ${FLAGS} ${FILE} -funsafe-math-optimizations ${FILE_N}

fast-math :	
	${CC} ${FLAGS} ${FILE} -ffast-math ${FILE_N}

rename-register :	
	${CC} ${FLAGS} ${FILE} -frename-registers ${FILE_N}

weird-reduce-ADDR-calc :	
	${CC} ${FLAGS} ${FILE} -fsection-anchors ${FILE_N}
icc :
	icc -w -g ${FILE} ${FILE_N}

icc-fast :
	icc -fast -w -debug ${FILE} ${FILE_N}

icc-fast-asm :
	icc -fast -S -w -debug ${FILE} ${FILE_N}

icc-O3 :	
	icc -O3 -w -g ${FILE} ${FILE_N}

icc-Ofast :	
	icc -Ofast -w -g ${FILE} ${FILE_N}
