/*
*	Program that demonstrates array of pointers to functions
*/

#include <stdio.h>
#include <math.h>

double add(double x, double y) { return x + y; }
double sub(double x, double y) { return x - y; }
double mul(double x, double y) { return x * y; }
double div(double x, double y) { return x / y; }


// array of 5 pointers to functions that take two double
// parameters and return a double
double (*funcTable[5])(double, double) = {add, sub, mul, div, pow};

// array of pointers to strings for output
char *msgTable[5] = { "Sum", "Difference", "Product", "Quotient", "Power" };

int main()
{
	int i;
	double x = 10, y = 5;

	for (i = 0; i < 5; ++i)
	{
		printf("%10s: %6.2f\n", msgTable[i], funcTable[i](x, y));
	}
	
	return 0;
}
