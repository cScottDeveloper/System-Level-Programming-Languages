#include <stdio.h>
#include <math.h>

/*
*  Demonstration of functions as arguments
*/

// function prototypes/declarations
double sum_square(double f(double), int, int);
double g(double);
double h(double);

// sum of square of f(x) where m <= x <= n
double sum_square(double f(double x), int m, int n)
{
	double sum = 0.0;

	for (int k = m; k <= n; k++) {
		sum += f(k) * f(k);
	}
	return sum;
}

// g(x) = 1.0 / x
double g(double x)
{
	return 1.0 / x;
}

// h(x) = x^2 + 5*x + 10
double h(double x)
{
	return pow(x,2) + 5*x + 10;
}

int main()
{
	printf(" First computation: %f\n", sum_square(g, 1, 1000));

	printf("Second computation: %f\n", sum_square(h, 5, 20));

	printf(" Third computation: %f\n", sum_square(sin, 50, 125));
	
	return 0;
}
