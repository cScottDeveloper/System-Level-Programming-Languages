#include <stdio.h>
#include <stdlib.h>

#define MAXLENGTH 80

int main(int argc,char *argv[])
{
	FILE *fp;

	char line[MAXLENGTH];

	if (argc < 2) {
		printf("Usage: program <filename>\n");
		exit(1);
	}

	fp = fopen(argv[1],"r");
	if (fp == NULL) {
		printf("File %s doesn't exist\n",argv[1]);
		exit(1);
	}

	while (fgets(line, MAXLENGTH, fp) != NULL) {
		printf("%s",line);
	}

	fclose(fp);

	return 0;
}
