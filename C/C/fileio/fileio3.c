#include <stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[])
{
	int n1, n2;
	FILE *fp;

	if (argc < 2) {
		printf("Usage: program <filename>\n");
		exit(1);
	}

	fp = fopen(argv[1],"r");
	if (fp == NULL) {
		printf("File %s doesn't exist\n",argv[1]);
		exit(1);
	}

	while (fscanf(fp, "%d,%d", &n1, &n2) != EOF) {
		printf("%d %d\n", n1, n2);
	}

	fclose(fp);

	return 0;
}
