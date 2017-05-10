/*	
	Projet module AOA - IATIC 4 - 2017 -
	Kernel pour le sujet 8
	Groupe : Doha ROUIBAA - Pablo BOURDELAS - Guillaume RYCKAERT
	Encacrant : Youenn LEBRAS
*/

#include "vegamissil.h"
#include "immintrin.h"

void kernel (int n, float a[n], int32_t ind[n] ,float b[n] ,float (*c)[]){

	int i,j;
	
	int k = ceil(n/sizeof(__m256));


	__m256 divTmp;

	__m256 (*Vc)[]=c;

	for (i=0;i<n;i++) c[n-1][i] = a[ind[i]];
	/*Cette boucle mérite des explications.
	 Pour éléminer les accés indirecte on recopie "a" la dernière ligne de "c". Comme ça on élimine l'accès indirect et on peut vectoriser*/

	for (i=0;i<n;i++){	
		divTmp = _mm256_set1_ps(1 / b[i]);

		for(j=0;j<k;j++){
			Vc[i][j]= _mm256_mul_ps(Vc[n-1][j], divTmp);
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
