#include <stdio.h>
#include <stdlib.h>

/* Demonstration of self-referential structures to represent a linear linked list */

struct linked_list {
	int val;
	struct linked_list *next;
};

typedef struct linked_list  ELEMENT;
typedef ELEMENT * LINK;

// function prototypes/declarations
LINK create_list(int [], int);
int count_items(LINK);
void print_list(LINK);

int main()
{
	int a[] = {5, 10, 15, 20, 25, 30};
	LINK head;

	head = create_list(a, 6);

	printf("The linked list has %d elements.\n", count_items(head));

	printf("The list is\n");
	print_list(head);
	printf("\n");
	
	return 0;
}

// creates a linked list from an array of int
LINK create_list(int a[], int n)
{
	LINK head = NULL, tail;

	if (n >= 1) {
		head = malloc(sizeof(ELEMENT));
		head->val = a[0];
		tail = head;
		for (int i = 1; i < n; i++) {
			tail->next = malloc(sizeof(ELEMENT));
			tail = tail->next;
			tail->val = a[i];
		}
		tail->next = NULL;
	}

	return head;
}

// returns the length of linked list
int count_items(LINK head)
{
	if (head == NULL) {
		return 0;
	} else {
		return (1 + count_items(head->next));
	}
}

// prints elements of linked list
void print_list(LINK head)
{
	if (head == NULL) {
		printf("NULL");
	} else {
		printf("%d --> ", head->val);
		print_list(head->next);
	}
}

