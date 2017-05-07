/*	
	Projet module AOA - IATIC 4 - 2017 -
	Kernel pour le sujet 8
	Groupe : Doha ROUIBAA - Pablo BOURDELAS - Guillaume RYCKAERT
	Encacrant : Youenn LEBRAS
*/


#include "vegamissil.h"
//#include ""

void kernel (int n, float Aa[n], int32_t Aind[n] ,float Ab[n] ,float (*Ac)[n]){
	int i,j;

	float *a = __builtin_assume_aligned(Aa, ALIGN);
	int32_t *ind = __builtin_assume_aligned(Aind, ALIGN);
	float *b = __builtin_assume_aligned(Ab, ALIGN);
	float (*c)[n] = __builtin_assume_aligned(Ac, ALIGN);

	float divTmp;

	for (i=0;i<n;i++) c[n-1][i] = a[ind[i]];//Cette boucle mérite des explications Pour éléminer les accés indirecte on recopie "a" la dernière ligne de "c". Comme ça on élimine l'accès indirect et on peut vectoriser

	for (i=0;i<n;i++){
		
		divTmp = 1 / b[i];

		for(j=0;j<n;j++){
			c[i][j]= c[n-1][j] * divTmp;
		}   
	}
}

/*
//		- Original Kernel implementation -

void kernel (int n, float a[n], int32_t ind[n] ,float b[n] ,float (*c)[n]){
	int i,j;

	for (j=0;j<n;j++){	
		for(i=0;i<n;i++){
			c[i][j]= a[ind[j]] / b[i];
		}   
	}
}
*/
