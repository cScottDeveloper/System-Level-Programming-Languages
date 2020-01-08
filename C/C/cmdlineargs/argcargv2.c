#include <stdio.h>
#include <stdlib.h>

// Echoing command line arguments

int main(int argc, char *argv[])
{
	int val;
	printf("argc = %d\n", argc);

	for (int i = 1; i < argc; i++) {
		printf("argv[%d] = %s\n", i, argv[i]);
		val = atoi(argv[i]);
		printf("argv[%d] as int = %d\n", i, val);
	}

	return 0;
}



