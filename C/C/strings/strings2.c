//#include <string.h>
#include <stdio.h>
#include <stdbool.h>

size_t strlen(const char *);
char *strcat(char *, const char *);

int main()
{
	char *name =  "John Doe";
	printf("%zd\n",strlen(name));
	
	name =  "Java";
	printf("%zd\n",strlen(name));
	
	return 0;
} 

size_t strlen(const char *s)
{
	size_t n;
	
	for (n = 0; *s != '\0'; s++) {
		n++;
	}
	
	return n;
}

char *strcat(char *s1, const char *s2)
{
	char *rtnPtr = s1;
	
	while (*s1 != '\0') {
		s1++;
	}
	
	while (true) {
		*s1 = *s2;
		if (*s2 == '\0') {
			break;
		}
		s1++;
		s2++;
	}
	
	return rtnPtr;
}

