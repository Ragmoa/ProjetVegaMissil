/*	
	Projet module AOA - IATIC 4 - 2017 -
	Kernel pour le sujet 8
	Groupe : Doha ROUIBAA - Pablo BOURDELAS - Guillaume RYCKAERT
	Encacrant : Youenn LEBRAS
*/


#include "vegamissil.h"

void kernel (int n, float a[n], int32_t ind[n] ,float b[n] ,float (*c)[n]){
	int i,j;

	for (j=0;j<n;j++){
		for(i=0;i<n;i++){
			c[i][j]= a[ind[j]] / b[i];
		}   
	}
}
