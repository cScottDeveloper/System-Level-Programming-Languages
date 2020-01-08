#include <stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[])
{
	int count=0;
	FILE *fp;

	int c;
	if (argc < 2) {
		printf("Usage: program <filename>\n");
		exit(1);
	}

	fp = fopen(argv[1],"r");
	if (fp == NULL) {
		printf("File %s doesn't exist\n",argv[1]);
		exit(1);
	}

	c = fgetc(fp);
	while (c != EOF) {
		count++;
		c = fgetc(fp);
	}

	fclose(fp);
	printf("%d\n",count);
	return 0;
}
