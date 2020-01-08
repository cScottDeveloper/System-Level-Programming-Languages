#include <stdio.h>

void fun1();

int i = 100;

int main()
{
	i++;
	printf("file1: %d\n", i);
	fun1();
	printf("file1: %d\n", i);
	
	return 0;
}

