CC=gcc
FLAGS=-O3
FILE=main.c kernel.c rdtsc.c
N=100

ref :
	${CC} ${FLAGS} ${FILE} -o vegaMissil

gottagofast :
	${CC} ${FLAGS} -funsafe-math-optimizations -o vegaMissil


 
