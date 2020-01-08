#include <stdio.h>

// function prototype/declaration
int power(int m, int n);

int main(void) {
	for (int i = 0; i < 10; i++) {
		printf("%d %d %d\n", i, power(2,i), power(3,i));
	}
	return 0;
}

// function definition of power
int power(int base, int n) {
	int p = 1;
	for (int i = 1; i <= n; i++) {
		p *= base;
	}
	return p;
}
