#include <stdio.h>

typedef int (*IntFunction) (int);

int square(int x)
{
   return x*x;
}

int evaluate(IntFunction g, int value)
{
   return g(value);
}

int main()
{
   	IntFunction f = square;

   	/* calling a function using a function type variabe */
   	int result = (*f) (10);
   	printf("%d\n", result);
   
	result = f(10);
   	printf("%d\n", result);

   	/* function type variable as argument to another function */
   	printf("%d\n", evaluate(f,5));

   	return 0;
}
