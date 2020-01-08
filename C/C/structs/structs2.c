#include <stdio.h>

struct student {
	char lastname[20];
	int student_id;
	char grade;
};

typedef struct student student;

// function declarations
void fill_struct_v1(student);
student fill_struct_v2(student);
void fill_struct_v3(student *);

void print_struct_v1(student);
void print_struct_v2(student *);

int main()
{
	student s1, s2;

	fill_struct_v1(s1);
	print_struct_v1(s1);

	s1 = fill_struct_v2(s1);
	print_struct_v1(s1);

	fill_struct_v3(&s2);
	print_struct_v1(s2);
	
	print_struct_v2(&s1);
	
	return 0;
}

void fill_struct_v1(student std)
{
	printf("\nEnter student lastname: ");
	gets(std.lastname);

	printf("Enter student id: ");
	scanf("%d", &std.student_id);
	getchar();	// ignore newline character

	printf("Enter student grade: ");
	scanf("%c", &std.grade);
	getchar();	// ignore newline character
}

student fill_struct_v2(student std)
{
	printf("\nEnter student lastname: ");
	gets(std.lastname);

	printf("Enter student id: ");
	scanf("%d", &std.student_id);
	getchar();	// ignore newline character

	printf("Enter student grade: ");
	scanf("%c", &std.grade);
	getchar();	// ignore newline character

	return std;
}

void fill_struct_v3(student *std)
{
	printf("\nEnter student lastname: ");
	gets(std->lastname);

	printf("Enter student id: ");
	scanf("%d", &std->student_id);
	getchar();	// ignore newline character

	printf("Enter student grade: ");
	scanf("%c", &std->grade);
	getchar();	// ignore newline character
}

void print_struct_v1(student std)
{
	printf("%s %d %c\n", std.lastname, std.student_id, std.grade);
}

void print_struct_v2(student *std)
{
	printf("%s %d %c\n", std->lastname, std->student_id, std->grade);
}


