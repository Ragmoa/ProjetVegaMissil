CC=gcc
FLAGS=-Og -Wall -g -lm -std=c11
INTEL_WIZARDRY=-L /opt/intel/compilers_and_libraries/linux/lib/intel64/ -mavx
FILE=kernel.c main.c

Og : ${FILE}
	${CC} -Og -Wall ${FILE} -o bin/$@

O2 : ${FILE}	
	${CC} -Og -Wall ${FILE} -o bin/$@

O3_native : ${FILE}
	${CC} ${FLAGS} -march=native ${FILE} -o bin/$@

test : ${FILE}
	${CC} ${FLAGS} ${FILE} -o $@ ${INTEL_WIZARDRY}

test-arch : ${FILE}
	${CC} ${FLAGS} ${FILE} -march=native -o $@

ref_O3 : ${FILE}
	${CC} ${FLAGS} ${FILE} -o bin/$@

Ofast : ${FILE}
	${CC} -Ofast -g ${FILE} -o bin/$@

unsafe-math : ${FILE}
	${CC} ${FLAGS} ${FILE} -funsafe-math-optimizations -o bin/$@

fast-math : ${FILE}	
	${CC} ${FLAGS} ${FILE} -ffast-math -o bin/$@

rename-register : ${FILE}	
	${CC} ${FLAGS} ${FILE} -frename-registers -o bin/$@

icc-O2 : ${FILE}	
	icc -O3 -w -g ${FILE} -o bin/$@

icc-O3_xHost : ${FILE}	
	icc -O3 -xHost -w -g ${FILE} -o bin/$@

icc-O3 : ${FILE}	
	icc -O3 -w -g ${FILE} -o bin/$@

icc-Ofast : ${FILE}	
	icc -Ofast -w -g ${FILE} -o bin/$@
