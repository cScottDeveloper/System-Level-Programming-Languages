#include <stdio.h>

// In C, all arguments are passed to a function using "call-by-value"

// To achieve the effect of "call-by-reference", pointers must be used for the parameters
// and addresses of variables must be passed as arguments

void swap_v1(int, int);

void swap_v2(int *, int *);

int main()
{
	int i = 5, j = 10;
	printf("i = %d j = %d\n", i, j);

	swap_v1(i, j);
	printf("After call to swap_v1: i = %d j = %d\n", i, j);

	swap_v2(&i, &j);
	printf("After call to swap_v2: i = %d j = %d\n", i, j);

	return 0;
}

void swap_v1(int x, int y)
{
	int temp;

	temp = x;
	x = y;
	y = temp;
}

void swap_v2(int *x, int *y)
{
	int temp;

	temp = *x;
	*x = *y;
	*y = temp;
}


