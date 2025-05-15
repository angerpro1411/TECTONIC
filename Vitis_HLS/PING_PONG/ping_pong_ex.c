

//Small equation
//vecOut = (VecIn%4)+1 / (VecIn%9)*2+1 

//Elements number
//Could change it to 320x240, pixel number of a small image
#define N 3

//Data go in by byte
typedef unsigned char data_t;

void algo(data_t vecIn[N], data_t vecOut[N]){
#pragma HLS dataflow
    //array to store the result,
    //if we write back the result,
    //it takes time and intefer to pipelining
    data_t a[N],b[N];
    data_t c[N],d[N];

    getRemainder(vecIn,a,b);

//2 functions are working in parallel thanks to no variable dependancy.
    add1(a,c);
    mul2add1(b,d);
    
    division(c,d,vecOut);
}

void getRemainder(data_t *in, data_t *out1, data_t *out2){
    for(int i=0;i<N;i++){
#pragma HLS pipeline rewind
#pragma HLS unroll factor = 2
    *(out1 + i) = *(in + i) % 4;
    *(out2 + i) = *(in + i) % 9;
    }    
}

//Function to calculate numerator
void add1(data_t *in, data_t *out){
    for(int i=0;i<N;i++){
#pragma HLS pipeline rewind
#pragma HLS unroll factor = 2
    *(out + i) = *(in + i) + 1;
    }
}

//Function to calculate Denominator
void mul2add1(data_t *in, data_t *out){
    data_t temp[N];
    for(int i=0;i<N;i++){
#pragma HLS pipeline rewind
#pragma HLS unroll factor = 2
    temp[i] = *(in + i)*2;
    *(out + i) = temp[i] + 1; 
    }    
}

void division(data_t *in1, data_t *in2, data_t *out){
    for(int i=0;i<N;i++){
#pragma HLS pipeline rewind
#pragma HLS unroll factor = 2
    *(out + i) = *(in1 + i) / *(in2 + i);
    }      
}