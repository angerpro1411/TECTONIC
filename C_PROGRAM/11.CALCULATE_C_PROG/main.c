#include "stdio.h"
#include "stdlib.h"
#include "time.h" 


int main(){
    int vecOut[100],vecIn[100];

    //Create array
    // Set the upper bound for random numbers
    int upper_bound = 10000;
    // Set the lower bound for random numbers
    int lower_bound = 100;
    
    for(int i=0;i<100;i++){
        vecIn[i] = rand() % (upper_bound - lower_bound + 1)
                    + lower_bound;
    }


    clock_t start, end;
    double cpu_time_used;

    start = clock();

    for(int j=0;j<10;j++){
        for(int i =0;i<100;i++){
            vecOut[i] = (vecIn[i]%9*2 + 1)/(vecIn[i]%4 + 1);
        }
    }

    end = clock();
    cpu_time_used = 1000000*(((double) (end - start)) / CLOCKS_PER_SEC) ;
    printf("function() took %f micro seconds to execute \n", cpu_time_used);

    return 0;
}