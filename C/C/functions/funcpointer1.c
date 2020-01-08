/*
*	Program that demonstrates function pointers
*/

#include <stdio.h>

float plus(float x, float y) {
	return x + y;
}

float minus(float x, float y) {
	return x - y;
}

float multiply(float x, float y) {
	return x * y;
}

float divide(float x, float y) {
	return x / y;
}

float compute(float ptr(float, float), float a, float b) {
	return ptr(a,b);
}

int main()
{
	// define a pointer to a function that takes two float values
	// and returns a float value
	float (*ptr2Func)(float,float);

	ptr2Func = plus;
	printf("%f\n",ptr2Func(10,10));

	ptr2Func = minus;
	printf("%f\n",ptr2Func(10,10));

	ptr2Func = multiply;
	printf("%f\n",ptr2Func(10,10));

	ptr2Func = divide;
	printf("%f\n",ptr2Func(10,10));

	printf("%f\n", compute(ptr2Func,10.0,15.0));
	printf("%f\n", compute(multiply,10.0,15.0));
	
	return 0;
}
