#include "vegamissil.h"




int main(int argc, char** argv){

    if (argc!=3)
    {
        fprintf(stderr,"Abandon:Mauvais nombre d'arguments\n");
        return -1;
    }
    else 
    {
        //HERE STARTS THE FUN !!
        //
        //INIT
        srand(time(NULL));
        int n=atoi(argv[2]);
        float *a=malloc(n*sizeof(float));
        int *ind=malloc(n*sizeof(int));
        float *b=malloc(n*sizeof(float));
        float *c [n]=malloc (n*n*sizeof(float));
        for (int i=0;i<n;i++)
        {
            a[i]=(float)((float)rand()/(float)RAND_MAX);
            b[i]=(float)((float)rand()/(float)RAND_MAX);
            ind[i]=(rand()%n);
            for (int j=0;j<n;j++)
            {
                c[i][j]=0;
            }
        }
        //INIT:DONE
        //
        //WARMUP

    }

}



