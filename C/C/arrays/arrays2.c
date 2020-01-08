#include <stdio.h>

void fill_array_v1(int [], int);
void fill_array_v2(int *, int);

void print_array_v1(int [], int);
void print_array_v2(int *, int);


int main(void)
{
	int i, j, n;

	printf("Enter array size: ");
	scanf("%d", &n);

	int a[n];

	/*
	printf("Enter %d integer values:\n", n);
	for (i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}

	printf("Array values:\n");
	i = 0;
	while (i < n) {
		printf("%d ", a[i++]);
	}
	*/

	fill_array_v1(a, n);
	print_array_v1(a, n);

	//fill_array_v2(a, n);
	//print_array_v2(a, n);
}

void fill_array_v1(int a[], int n)
{
	printf("Enter %d integer values:\n", n);
	for (int i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}
}

void print_array_v1(int a[], int n)
{
	printf("Array values:\n");
	int i = 0;
	while (i < n) {
		printf("%d ", a[i++]);
	}
}

void fill_array_v2(int *a, int n)
{
	printf("Enter %d integer values:\n", n);
	for (int i = 0; i < n; i++) {
		scanf("%d", (a+i));
	}
}

void print_array_v2(int *a, int n)
{
	printf("Array values:\n");
	int i = 0;
	while (i < n) {
		printf("%d ", *(a + i));
		i++;
	}
}

