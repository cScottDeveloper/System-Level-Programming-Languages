#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *get_line(FILE *f);

int main(int argc,char *argv[])
{
	int count=0;
	char *line;

	// read from stdin
	while ((line = get_line(stdin)) != NULL) {
		count++;
		printf("%zd: %s\n",strlen(line),line);
		free(line);
	}
	printf("Line count: %d\n",count);
	
	// read from a file
	count = 0;
	printf("\nHere is text from the file:\n");
	FILE *fp = fopen("test.txt","r");
	while ((line = get_line(fp)) != NULL) {
		count++;
		printf("%zd: %s\n",strlen(line),line);
		free(line);
	}
	printf("Line count: %d\n",count);
	
	return 0;
}

char *get_line(FILE *f)
{
	int size = 80; // initial size of memory block allocated
	
	char *linePtr = malloc(size);
	
	if (linePtr != NULL) {
		int c = EOF;
		
		// read a line of text and replace newline character
		// with a string terminator character
		int i = 0;
		while ((c = getc(f)) != '\n' && c != EOF) {
			linePtr[i++] = (char) c;
			if (i == size) {
				size *= 2;
				linePtr = realloc(linePtr, size);
			}
		}
		linePtr[i] = '\0';
		
		// if end-of-file before any characters were read,
		// release the whole buffer
		if (c == EOF && i == 0) {
			free(linePtr);
			linePtr = NULL;
		} else {
			linePtr = realloc(linePtr, i+1); // release unused portion of memory
		}
	}
	
	return linePtr;
}

