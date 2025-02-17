
#define GET_SLOT_BASE_ADDRESS(MMIO_BASE,SLOT_NUMB) (unsigned int)(MMIO_BASE+SLOT_NUMB*32*4)

/*
* We need understand why each reg addr we need to add 4, because memory is aligned by Bytem so each 32 bits are aligned in 4 rows.
* Each register points to 32-bits memory so the address need to be divisible by 4.
* We create a function-an equation to address each address.
*/

#define BYTE_ADDRESSIBLE 4

#define REG0_OFFSET 0*BYTE_ADDRESSIBLE
#define REG1_OFFSET 1*BYTE_ADDRESSIBLE
#define REG2_OFFSET 2*BYTE_ADDRESSIBLE
#define REG3_OFFSET 3*BYTE_ADDRESSIBLE

/*
 * Bit manipulation
*/

#define BIT_SET(data,n)             ( data = data |   1<<n  )
#define BIT_CLR(data,n)             ( data = data & ~(1<<n) )
#define BIT_READ(data,n)            ( (data>>n) & 0x00000001)
#define BIT_WRITE(data,n,value)     ( value?            BIT_SET(data,n) : BIT_CLR(data,n) )
#define BIT_TOGGLE(data,n)          ( BIT_READ(data,n)? BIT_CLR(data,n) : BIT_SET(data,n) )

