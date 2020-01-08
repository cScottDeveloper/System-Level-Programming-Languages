#include <stdio.h>

typedef int Length;

struct dob {
	int day;
	int month;
	int year;
};

typedef struct dob DOB;

typedef struct {int day; int month; int year;} DOB_V2;

int main() {
	Length side1, side2;

	struct dob  d1;
	d1.day = 15;
	d1.month = 8;
	d1.year = 1980;
	printf("%d %d %d\n", d1.day, d1.month, d1.year);

	DOB d2;
	d2.day = 1;
	d2.month = 1;
	d2.year = 1995;
	printf("%d %d %d\n", d2.day, d2.month, d2.year);

	DOB_V2 d3;
	d3.day = 10;
	d3.month = 10;
	d3.year = 1990;
	printf("%d %d %d\n", d3.day, d3.month, d3.year);

	d1 = d2;
	printf("%d %d %d\n", d1.day, d1.month, d1.year);

	//d1 = d3;

	//d2 = d3;
	
	return 0;
}
