CC=gcc
FLAGS=-O3 -Wall
FILE=main.c kernel.c
FILE_N=-o vegaMissil
N=100

back :
	${CC} -Og -Wall ${FILE} ${FILE_N}

ref :
	${CC} ${FLAGS} ${FILE} ${FILE_N}

gottagofast :
	${CC} -Ofast ${FILE} ${FILE_N}

unsafe-math :
	${CC} ${FLAGS} ${FILE} -funsafe-math-optimizations ${FILE_N}

fast-math :	
	${CC} ${FLAGS} ${FILE} -ffast-math ${FILE_N}

rename-register :	
	${CC} ${FLAGS} ${FILE} -frename-registers ${FILE_N}

weird-reduce-ADDR-calc :	
	${CC} ${FLAGS} ${FILE} -fsection-anchors ${FILE_N}
icc :
	icc -w ${FILE} ${FILE_N}

