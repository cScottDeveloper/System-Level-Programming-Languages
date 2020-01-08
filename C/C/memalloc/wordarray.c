#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>

void printArray(char **list, int nbrWords);

int main()
{
	char **list, word[20];
	int currSize = 5, nbrWords = 0;

	// initial memory allocation for the array
	list = (char **) calloc(currSize, sizeof(char *));

	while (true) {
		printf("Enter a word (press ctrl-d to end): ");
		if (fgets(word, sizeof(word), stdin) == NULL) {
			break;
		}
		word[strlen(word)-1] = '\0';	// remove newline character
		
		if (nbrWords == currSize) {	// if array is full, increase size
			currSize *= 2;
			list = (char **) realloc(list, currSize * sizeof(char *));
			if (list == NULL) {
				fprintf(stderr,"memory reallocation failed\n");
				exit(EXIT_FAILURE);
			}			
		}
		
		list[nbrWords] = (char *) malloc(strlen(word)+1);
		strcpy(list[nbrWords],word);
		nbrWords++;
	}

	// release memory of unoccupied cells in the array
	if (nbrWords < currSize) {
		list = (char **) realloc(list, nbrWords * sizeof(char *));
	}
	
	printArray(list,nbrWords);
	
	return EXIT_SUCCESS;
}

void printArray(char **list, int nbrWords)
{
	printf("\nArray of words:\n");
	int i = 0;
	while (i < nbrWords) {
		printf("%s\n", list[i]);
		i++;
	}
}
