#include <stdio.h>

void print2DArray_v1(int rows, int cols, int p[][cols]);
void print2DArray_v2(int rows, int cols, int p[][cols]);

int *getArray(void);

int main(void)
{
	int i, j;
	int data2D[3][4];

	// accessing array element using subscript operator
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 4; j++) {
			data2D[i][j] = i + j;
			printf("%d ", data2D[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	
	// accessing array element using pointer
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 4; j++) {
			*(*(data2D + i) + j) =  100;
			printf("%d ", *(*(data2D + i) + j));
		}
		printf("\n");
	}
	printf("\n");
	
	print2DArray_v1(3, 4, data2D);
	printf("\n");
	
	print2DArray_v2(3, 4, data2D);
	
	int *x;
	x = getArray();
	printf("x = %d %d %d\n", x[0], x[1], x[2]);
}

void print2DArray_v1(int rows, int cols, int p[][cols])
{
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < cols; j++) {
			printf("%d ", p[i][j]);
		}
		printf("\n");
	}
}

void print2DArray_v2(int rows, int cols, int p[][cols])
{
	for (int i = 0; i < rows; i++) {
		for (int j = 0; j < cols; j++) {
			printf("%d ", *(*(p + i) + j));
		}
		printf("\n");
	}
}

int* getArray(void)
{
	int a[] = {1, 2, 3};
	return a;
}
