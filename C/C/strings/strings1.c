#include <string.h>
#include <stdio.h>

int main()
{
	char *name = "John Doe";
	printf("%zd\n",strlen(name));
	
	name = "Java is fun!";
	printf("%zd\n",strlen(name));
	
	char *ch1 = "Java";
	char *ch2 = "Java";
	printf("%p %p %p %p %c %c\n", &ch1, &ch2, ch1, ch2, *ch1, *ch2);
	//*ch1 = 'L';
	
	char s1[25] = "Java ";
	char *s2 = "is fun!";
	strcat(s1,s2);
	printf("%s\n",s1);
	
	char *ch;
	ch = strchr(s1,'f');
	printf("%s\n",ch);
	
	int result = strcmp(s1,s2);
	printf("%d\n",result);
	
	strcpy(s1,s2);
	printf("%s\n", s1);
	
	ch = strstr("Java is fun to program!","fun");
	printf("%s\n", ch);
	
	char s3[] = "C language, though gibberish, is so much more fun!";
	printf("%s\n", s3);
	
	ch = strtok(s3," ,");
	do {
		printf("%s\n", ch);
	} while ((ch = strtok(NULL," ,")) != NULL);
	
	printf("%s\n", s3);
	
	return 0;
} 

