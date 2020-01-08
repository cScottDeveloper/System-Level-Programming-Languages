#include <stdio.h>

extern int i;

void fun1()
{
	printf("file2: %d\n", i);
	i++;
}
