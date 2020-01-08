#include <stdio.h>

void printArray(int *, int);

int main(void)
{
	int i, data[10];

	// accessing array element using subscript operator
	for (int i = 0; i < 10; i++) {
		data[i] = i;
		printf("%d ", data[i]);
	}
	printf("\n\n");
	
	// accessing array element using pointer
	for (int i = 0; i < 10; i++) {
		*(data + i) = i;
		printf("%d ", *(data +  i));
	}
	printf("\n\n");
	
	printArray(data, 10);	// print all elements
	
	printArray(data, 5);	// print first 5 elements
	
	printArray(&data[4], 5);	// print 5 elements starting from index 4
	
	int *p;
	p = data;	// same as p = &data[0]
	printArray(p,10);
	
	p = &data[6];
	printArray(p,3);
	
	p++;
	printArray(p,3);
	
	//data++;
	
	//int size = sizeof(data) / sizeof(int);
	//printf("size = %d\n", size);
	
}

void printArray(int *p, int n)
{	
	for (int i = 0; i < n; i++) {
		printf("%d ", *(p + i));
	}
	printf("\n\n");
}
