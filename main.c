#include "vegamissil.h"

int main(int argc, char** argv){

    if (argc!=4)
    {
        fprintf(stderr,"Abandon:Mauvais nombre d'arguments\n");
        return -1;
    }
    else 
    {
        //HERE STARTS THE FUN !!
        //
        //INIT
        srand(666);
        int n=atoi(argv[2]);
        float *a=malloc(n*sizeof(float));
        int *ind=malloc(n*sizeof(int));
        float *b=malloc(n*sizeof(float));
        float (*c)[n]=malloc (n*n*sizeof(float));
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
        int warmup=atoi(argv[1]);
        int calc=atoi(argv[2]);
        for (int i=0;i<warmup;i++)
        {
            kernel(n,a,ind,b,c);
        }

        float m = 0;

        for (int i=0;i<calc;i++)
        {
            uint64_t start=get_cycles();
            kernel(n,a,ind,b,c);
            uint64_t end=get_cycles();
    
            m+=end -start;
        }

        m/=calc;
        printf ("%f\n",m);
    }

    return 0;
}

