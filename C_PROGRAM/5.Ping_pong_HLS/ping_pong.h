//Small equation
//vecOut =  (VecIn%9)*2+1 / (VecIn%4)+1

//Elements number
//Could change it to 320x240, pixel number of a small image
#define N 100

//Data go in by byte
typedef unsigned char data_t;

//Function definitions
void getRemainder(data_t *in, data_t *out1, data_t *out2);
void add1(data_t *in, data_t *out);
void mul2add1(data_t *in, data_t *out);
void division(data_t *in1, data_t *in2, data_t *out);
void algo(data_t vecIn[N], data_t vecOut[N]);
