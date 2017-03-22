CC=gcc
FLAGS=-O3
FILE=main.c kernel.c rtdsc.c
N=100

ref :
	${CC} ${FLAGS} ${FILE} -o vegaMissil

gottagofast :
	${CC} -0fast -o vegaMissil

 
