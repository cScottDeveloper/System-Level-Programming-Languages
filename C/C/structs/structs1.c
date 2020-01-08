#include <stdio.h>

#define CLASS_SIZE 25

struct student {
	char lastname[20];
	int student_id;
	char grade;
};

int main()
{
	struct student s1, s2, class[CLASS_SIZE];

	printf("Enter student lastname: ");
	gets(s1.lastname);
	//fgets(s1.lastname, sizeof(s1.lastname), stdin);

	printf("Enter student id: ");
	scanf("%d", &s1.student_id);
	getchar();	// ignore newline character

	printf("Enter student grade: ");
	scanf("%c", &s1.grade);

	s2 = s1;
	printf("%s %d %c\n", s1.lastname, s1.student_id, s1.grade);
	printf("%s %d %c\n", s2.lastname, s2.student_id, s2.grade);
	
	return 0;
}


