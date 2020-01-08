#include <stdio.h>

void changeArray(int size, int p[][size]);

int main(void)
{
	int i, j;
	int data[3][3];

	changeArray(3, data);
	
	// accessing array element using subscript operator
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			printf("%d ", data[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	
}

void changeArray(int size, int p[][size])
{
	for (int i = 0; i < size; i++) {
		for (int j = 0; j < size; j++) {
			p[i][j] = 100;
		}
	}
}
