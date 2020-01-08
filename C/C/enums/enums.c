#include <assert.h>
#include <stdio.h>

/*
*   Enumeration types provide a means of naming a finite set of values, and
*   of declaring identifiers as set elements.
*/

enum day {sun, mon,tue, wed, thu, fri, sat};

typedef enum day day;

day find_next_day_v1(day);
day find_next_day_v2(day);

int main()
{
	day d1, d2;

	d1 = mon;

	d2 = find_next_day_v1(d1);
	printf("d1 = %d d2 = %d\n", d1, d2);

	d2 = find_next_day_v2(d1);
	printf("d1 = %d d2 = %d\n", d1, d2);
}

day find_next_day_v1(day d)
{
	day next_day;
	switch (d) {
		case sun:
			next_day = mon;
			break;
		case mon:
			next_day = tue;
			break;
		case tue:
			next_day = wed;
			break;
		case wed:
			next_day = thu;
			break;
		case thu:
			next_day = fri;
			break;
		case fri:
			next_day = sat;
			break;
		case sat:
			next_day = sun;
			break;
	}
	return next_day;
}

day find_next_day_v2(day d)
{
	assert((int)d >= 0 && (int)d < 7);
	return (day)(((int)d + 1) % 7);
}

