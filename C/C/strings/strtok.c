#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{	
	char s[] = "C language, though gibberish, is so much more fun to program!";
	
	printf("Original string: %s\n\n", s);
	
	char *ch = strtok(s," ,");
	do {
		printf("%s\n",ch);
	} while ((ch = strtok(NULL," ,")) != NULL);
	
	printf("\nOriginal string now: %s\n", s);
	
	return EXIT_SUCCESS;
} 

