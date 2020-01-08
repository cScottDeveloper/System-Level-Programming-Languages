#include <stdio.h>
#include <math.h>

int main() {
	double result;
	double (*funcPtr) (double);
	
	funcPtr = sqrt;		// assign pointer to sqrt() function in math.h
	
	result = (*funcPtr)(25.0);
	printf("%f\n", result);
	
	result = funcPtr(4.0);
	printf("%f\n", result);
	
	return 0;
}

