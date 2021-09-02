#include <iostream>

#define iterationsToDo 4096
//#define iterationsToDo 25
#define isNumberEven(n) (n % 2 == 0)

__global__ void calculate(double *runningSum) {
    int index = threadIdx.x;
    int stride = blockDim.x;

    for (int i = index; i < iterationsToDo; i += stride) {

        double numerator = isNumberEven(i) ? 1 : -1;
        double denominator = 2 * i + 1;

        *runningSum += numerator / denominator;
    }
}

__global__ void init(double* runningSum) {
    *runningSum = 0;
}

__global__ void printTheThing(double *thingToPrint) {
    printf("!!! TEST !!!%.20lf", *thingToPrint * 4);
}

void doIt() {
    double *runningSum;

    if (cudaMalloc((void **) &runningSum, sizeof(double)) != cudaSuccess) {
        puts("Something truly terrible happened");
        exit(1);
    }
    init<<<1, 1>>>(runningSum);

    calculate<<<1, 1>>>(runningSum);
    cudaDeviceSynchronize();

    printTheThing<<<1, 1>>>(runningSum);
    cudaDeviceSynchronize();
}

int main() {
    doIt();
    return 0;
}
