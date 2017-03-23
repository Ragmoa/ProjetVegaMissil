#include "vegamissil.h"

void kernel (int n, float a[n],int ind[n] ,float b[n] ,float c[n][n]){
    int i,j;
    for (j=0;j<n;j++){
        for(i=0;i<n;i++){
        c[i][j]= a[ind[j]] / b[i];
        }
    
    }
    /* fprintf(stderr,"%f\n",c[0][0]);  Note : Useless et rend les performances inconsitentes */
}
