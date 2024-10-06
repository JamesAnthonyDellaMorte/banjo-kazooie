#include <ultra64.h>
#include "functions.h"
#include "variables.h"

float gu_sqrtf(float a) {
    float result;
    __asm__ volatile (
        "sqrt.s %0, %1\n\t" // Perform the square root operation
        : "=f"(result)      // Output operand: the result will be stored in 'result'
        : "f"(a)            // Input operand: the input is the float 'a'
        :                   // Clobber list (none in this case)
    );
    return result;
}

