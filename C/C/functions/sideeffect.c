#include <stdio.h>

int x = 0;

int foo()
{
    x += 5;
    return x;
}

int main()
{
	int a = foo() + x + foo();
	printf("%d\n", a);
	return 0;
}


