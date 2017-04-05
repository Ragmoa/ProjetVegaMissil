/*	
	Projet module AOA - IATIC 4 - 2017 -
	Driver pour le sujet 8
	Groupe : Doha ROUIBAA - Pablo BOURDELAS - Guillaume RYCKAERT
	Encacrant : Youenn LEBRAS
*/

#include "vegamissil.h"

int main(int argc, char** argv){
	
	int n = DFLT_D_SIZE;
	int warmup = DFLT_WARMUP;
	int calc = DFLT_NREP;
	
	double m=0.0;

	uint64_t start=0;
	uint64_t end=0;	

	FILE * fwarmup = NULL;

	int i=0;
	
//ARGs PARSING
	switch(argc){
		case 4 :
			n = atoi(argv[3]);
			if(n==0){
				fprintf(stderr, "Erreur : Taille de donnée invalide\n");
				exit(EXIT_FAILURE);
			}
		case 3 :
			calc = atoi(argv[2]);	
			if(calc==0) fprintf(stderr, "Attention : Nombre de répétion invalide ou égal à zero\n");
		case 2 :
			warmup = atoi(argv[1]);	
			if(warmup==0) fprintf(stderr, "Attention : Durée de warmup invalide ou égal à zero\n");				
		case 1 ://Utilise les valeurs par default
		break;
		default :
			fprintf(stderr,"Erreur : Nombres d'arguments invalide\nUsage : vegaMissil [Durée warmup] [Nombre répétions] [Taille de donnée]\n");
			exit(EXIT_FAILURE);
		break;
	}

//ALLOCATION
	float *a = malloc(n*sizeof(float));
	float *b = malloc(n*sizeof(float));
	float (*c)[n] = malloc (n*n*sizeof(float));
 
	int32_t *ind = malloc(n*sizeof(int32_t)); //On force en int_32 pour avoir la même taille qu'un float

	int64_t *buffWrm = malloc(warmup*sizeof(int64_t));

//INIT
	srand(SEED);

	for (i=0;i<n;i++){
		a[i]=(float)((float)rand()/(float)RAND_MAX);
		b[i]=(float)((float)rand()/(float)RAND_MAX);
		ind[i]=(rand()%n);

		for (int j=0;j<n;j++){
			c[i][j]=0;
		}
	}

//WARMUP
	for (i=0;i<warmup;i++){
		start = get_cycles();
		kernel(n,a,ind,b,c);
		end = get_cycles();
		
		buffWrm[i] = end-start;
	}

// PERF RUN
	m = 0.0;
	
	start=get_cycles();
	
	for(i=0; i<calc ; i++){
		kernel(n,a,ind,b,c);
	}

	end=get_cycles();
	
	if(calc!=0) m= (float) end / calc;


//OUTPUT & CLEANING
	
	printf ("%lf\n", m);
		
	fwarmup = fopen("warmup.tsv", "w+");
	if(fwarmup == NULL) fprintf(stderr, "Imposible d'ouvrir le fichier pour le stockage des données du warmup !\n");
	else{
		for(i=0 ; i<warmup ; i++){
			fprintf(fwarmup, "%u\t%"PRIi64"\n", i, buffWrm[i]);
		}
		fclose(fwarmup);
	}

	free(a);
	free(ind);
	free(b);
	free(c);
	free(buffWrm);
    
	exit(EXIT_SUCCESS);
}

uint64_t get_cycles(){
	uint64_t a, d;
	__asm__ volatile ("rdtsc" : "=a" (a), "=d" (d));
	return (d<<32) | a;
}
