/*	
	Projet module AOA - IATIC 4 - 2017 -
	Header pour le sujet 8
	Groupe : Marina BLE - Doha ROUIBAA - Pablo BOURDELAS - Guillaume RYCKAERT
	Encacrant : Youenn LEBRAS
*/

#ifndef _VEGAMISSIL
#define _VEGAMISSIL

//INCLUDES

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h>
#include <immintrin.h>
#include <xmmintrin.h>

//DEFINE

#define __STDC_FORMAT_MACROS

#define FILE_NAME warmup.tsv

#define DFLT_D_SIZE 85
#define DFLT_WARMUP 10000
#define DFLT_NREP 20

#define SEED 666


#define IND(row, col, n) (row*n)+col /*Attention N = SIZE+ PADDING*/
//PROTOTYPES

void kernel(int n,float a[n], int32_t ind[n],float b[n], float (*c)[n]);

uint64_t get_cycles();

#endif
