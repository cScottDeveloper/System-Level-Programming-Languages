#include <stdio.h>

int main(void)
{
	int x[] = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
	int i = 5;
	int *p;

	printf("x[i] = %d\n", x[i]);
	printf("*(x+i) = %d\n", *(x+i));
	
	*(x+i) = 65;
	printf("x[i] = %d\n", x[i]);

	p = x;
	printf("p[i] = %d\n", p[i]);
	printf("*(p+i) = %d\n", *(p+i));

	p = x + 3;
	printf("p[i] = %d\n", p[i]);
	printf("*(p+i) = %d\n", *(p+i));

	p = &x[4];
	printf("p[i] = %d\n", p[i]);
	printf("*(p+i) = %d\n", *(p+i));

	p = (int *) x[4];  	// not a good idea
	//printf("%d\n", *p);	// segmentation fault?

	//x = p + 3;	// invalid - reason?
	//x = x + 5;  // invalid - reason?
	
	printf("%d\n", x[5]);
	printf("%d\n", 5[x]);

	return 0;
}

