#include "vegamissil.h"

int main(int argc, char** argv){

    if (argc!=4)
    {
        fprintf(stderr,"Abandon : Mauvais nombre d'arguments\n");
        return -1;
    }
    else 
    {
        //HERE STARTS THE FUN !!

        //INIT
        srand(666);
        int n=atoi(argv[3]);
        float *a=malloc(n*sizeof(float));
        uint32_t *ind=malloc(n*sizeof(uint32_t));
        float *b=malloc(n*sizeof(float));
        float (*c)[n]=malloc (n*n*sizeof(float));
      
	double m=0.0;
	uint64_t start=0;
	uint64_t end=0;	

	FILE * fwarmup = NULL;

	fwarmup = fopen("warmup.csv", "r+");	

	for (int i=0;i<n;i++){

            a[i]=(float)((float)rand()/(float)RAND_MAX);
            b[i]=(float)((float)rand()/(float)RAND_MAX);
            ind[i]=(rand()%n);

            for (int j=0;j<n;j++){
                c[i][j]=0;
            }
        }
        //INIT:DONE

        //WARMUP
        int warmup=atoi(argv[1]);
        int calc=atoi(argv[2]);
	
        for (int i=0;i<warmup;i++){

            	start=get_cycles();
	        kernel(n,a,ind,b,c);
		end=get_cycles();
	
		fprintf(fwarmup, "%d %d\n", i, end-start);
        }


	/* Perf Run */
       	for(int i=0; i<calc ; i++){
        	start=get_cycles();
	        kernel(n,a,ind,b,c);
		end=get_cycles();
		m+=end-start;
	}           

        m/=calc;

        fprintf (stdout ,"%lf\n", m);
    	
	fclose(fwarmup);	
	
	}
    
	return EXIT_SUCCESS;

}
