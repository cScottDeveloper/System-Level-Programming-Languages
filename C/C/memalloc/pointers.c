#include <stdio.h>

int main()
{
	int j = 100;
	int *pi = &j;
	
	float *pf = &j;
	
	// pv can store address of any object, but not its type
	void *pv = &j;
	
	printf("%d %p %p %p %p\n", j, &j, pi, pf, pv);
	printf("%d %d %d\n", j, *((int *)pv), *((int *)pf));
	
	int *p = NULL;
	p = pi;
	printf("%p %d %d\n", p, *p, *pi);
	
	return 0;
}
