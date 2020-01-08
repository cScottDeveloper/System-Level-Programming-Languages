#include <stdio.h>

void printArray_v1(int rows, int cols, int p[][cols]);
void printArray_v2(int rows, int cols, int p[][cols]);

int main(void)
{
	int i, j, data[3][4];

	// accessing array element using subscript operator
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 4; j++) {
			data[i][j] = i + j;
			printf("%d ", data[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	
	// accessing array element using pointer
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 4; j++) {
			*(*(data + i) + j) =  100;
			printf("%d ", *(*(data + i) + j));
		}
		printf("\n");
	}
	printf("\n");
	
	printArray_v1(3, 4, data);
	printf("\n");
	
	printArray_v2(3, 4, data);
	
}

void printArray_v1(int rows, int cols, int p[][cols])
{
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < cols; j++) {
			printf("%d ", p[i][j]);
		}
		printf("\n");
	}
}

void printArray_v2(int rows, int cols, int p[][cols])
{
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < cols; j++) {
			printf("%d ", *(*(p + i) + j));
		}
		printf("\n");
	}
}
