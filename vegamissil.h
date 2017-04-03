#ifndef _VEGAMISSIL
#define _VEGAMISSIL

//INCLUDES

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>
#include <inttypes.h>


//DEFINE

#define __STDC_FORMAT_MACROS

#define FILE_NAME warmup.tsv

#define DFLT_D_SIZE 85
#define DFLT_WARMUP 10000
#define DFLT_NREP 20

#define SEED 666

//PROTOTYPES

void kernel(int n,float a[n], int32_t ind[n],float b[n], float c[n][n]);

uint64_t get_cycles();

#endif
