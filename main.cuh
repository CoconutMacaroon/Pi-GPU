#ifndef pi_gpu_main
#define pi_gpu_main

#include <iostream>
#include <limits>
#include <cmath>
#include <ctime>

typedef struct point
{
    long double x;
    long double y;
} point;

#define scale(number, inMin, inMax, outMin, outMax) ((long double)(((long double)number - (long double)inMin) * ((long double)outMax - (long double)outMin) / ((long double)inMax - inMin) + (long double)outMin))
#define distance(x1, x2, y1, y2) ((long double)(sqrt(pow(((long double)x2 - (long double)x1), 2) + pow(((long double)y2 - (long double)y1), 2))))

// VERY IMPORTANT: ITERATIONS_TO_DO MUST be a perfect square. Always.
#define ITERATIONS_TO_DO 67108864
#define ITERATIONS_TO_DO_SQRT ((long int)std::sqrt(ITERATIONS_TO_DO))

#define MOVE_INCREMENT (1/(long double)ITERATIONS_TO_DO_SQRT)
#define STARTING_SEED (std::time(0))

#endif
