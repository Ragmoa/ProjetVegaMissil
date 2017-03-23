CC=gcc
FLAGS=-O3
FILE=main.c kernel.c
FILE_N=-o vegaMissil
N=100

ref :
	${CC} ${FLAGS} ${FILE} ${FILE_N}

gottagofast :
	${CC} -Ofast ${FILE} ${FILE_N}

unsafe-math :
	${CC} ${FLAGS} ${FILE} -funsafe-math-optimizations ${FILE_N}


 
