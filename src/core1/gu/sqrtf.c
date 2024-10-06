#include <ultra64.h>
#include "functions.h"
#include "variables.h"

float gu_sqrtf(float val) {
    // Fast approximation using bit manipulation trick without union.
    u32 conv;
    float result;
    memcpy(&conv, &val, sizeof(val)); // Use memcpy to get the bits of the float.

    // Approximate square root by halving the exponent.
    conv = (conv >> 1) + 0x1FC00000;

   
    memcpy(&result, &conv, sizeof(conv)); // Convert back to float using memcpy.
    
    return result;
}

