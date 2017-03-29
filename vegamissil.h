#ifndef _VEGAMISSIL
#define _VEGAMISSIL

//INCLUDES

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>
#include <inttypes.h>

//PROTOTYPES
void kernel(int n,float a[n],uint32_t ind[n],float b[n], float c[n][n]);

inline uint64_t get_cycles()
{
      uint64_t t;
        __asm volatile ("rdtscp" : "=A"(t));
        return t;
}

#endif
