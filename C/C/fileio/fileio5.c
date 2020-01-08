#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXLENGTH 80

int main(int argc,char *argv[])
{
	FILE *fp;
	int n1, n2;
	char *token = NULL;

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
		if (strchr(line, ',') == NULL) {
			n1 = atoi(line);
			printf("%d\n", n1);
		} else {
			token = strtok(line, ",");
			n1 = atoi(token);
			token = strtok(NULL, ",");
			n2 = atoi(token);
			printf("%d %d\n", n1, n2);
		}
	}

	fclose(fp);

	return 0;
}
