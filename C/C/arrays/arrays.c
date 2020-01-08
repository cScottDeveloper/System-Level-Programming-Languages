#include <stdio.h>
#include <stdlib.h>
	
int main(int argc, char *argv[])
{
	int n = atoi(argv[1]);
	int data[n][n];

	// fill the array with values
	printf("Getting ready to read values into a (%d,%d) array of ints.\n", n, n);
	for (int i = 0; i < n; i++) {
		printf("Enter %d values for row %d: ", n, i);
		for (int j = 0; j < n; j++) {
			scanf("%d", &data[i][j]);
		}
	}

	// print array values	
	printf("Here are the values you entered:\n");
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			printf("%d ", data[i][j]);
		}
		printf("\n");
	}
}
