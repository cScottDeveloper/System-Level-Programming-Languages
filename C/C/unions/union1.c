#include <stdio.h>

/*
*   A union type defines a set of alternative values that may be stored
*  in a shared portion of memory. They are more commonly used to conserve storage
*  by allowing the same space in memory to be used for a variety of types.
*
*   It is the programmer's responsibility to know which respresentation is
*   currently stored in a union variable.
*/

union int_or_float {
	int  i;
	float f;
};

typedef union int_or_float number;

int main()
{
	number n;

	n.i = 4444;
	printf("i: %10d     f: %16.10e\n", n.i, n.f);

	n.f = 4444.0;
	printf("i: %10d     f: %16.10e\n", n.i, n.f);

	return 0;
}

