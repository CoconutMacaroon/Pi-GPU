#include "main.cuh"

int main()
{
    // Create an array of points
    point *points = (point *)malloc(sizeof(point) * ITERATIONS_TO_DO);

    long int pointsWithinDistanceOfOneToOrigin = 0;

    long double x = 0;
    long double y = 0;

    for (long int i = 0; i < ITERATIONS_TO_DO_SQRT; i++)
    {
        for (long int j = 0; j < ITERATIONS_TO_DO_SQRT; j++)
        {
            points[(i * ITERATIONS_TO_DO_SQRT) + j].x = x;
            points[(i * ITERATIONS_TO_DO_SQRT) + j].y = y;
            x += MOVE_INCREMENT;
        }
        x = 0;
        y += MOVE_INCREMENT;
    }

    // and run the algorithm
    for (long int i = 0; i < ITERATIONS_TO_DO; i++)
    {
        if (std::abs(distance(0, points[i].x, 0, points[i].y)) < 1)
        {
            pointsWithinDistanceOfOneToOrigin++;
        }
    }

    // ITERATIONS_TO_DO needs to be made into a long double to force proper division. Otherwise, it will do integer division.
    long double pi = 4 * (pointsWithinDistanceOfOneToOrigin / (long double)ITERATIONS_TO_DO);

    // print the result
    printf("Pi is %Lf\n", pi);

    // free the allocated memory
    free(points);

    return 0;
}
