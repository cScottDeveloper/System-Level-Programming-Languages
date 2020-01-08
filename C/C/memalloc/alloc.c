#include <stdio.h>
#include <stdlib.h>

void fill_array_v1(int [], int);
void print_array_v1(int [], int);

void fill_array_v2(int *, int);
void print_array_v2(int *, int);

/* Demonstration of dynamic memory allocation */

int main()
{
	int *a, n;

	for (;;) {
		printf("Enter array size: ");
		scanf("%d", &n);
		if (n < 1) {
			break;
		}
		a = calloc(n, sizeof(int));
		if (a != NULL) {
			fill_array_v2(a, n);
			print_array_v2(a, n);
			free(a);
		}
	}

	printf("Bye\n");
	return 0;
}

void fill_array_v1(int a[], int n)
{
	int i;
	printf("Enter %d integer values:\n", n);
	for (i = 0; i < n; i++) {
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
	printf("\n");
}

void fill_array_v2(int *a, int n)
{
	int i = 0;
	printf("Enter %d integer values:\n", n);
	for (; i < n; i++) {
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
	printf("\n");
}


