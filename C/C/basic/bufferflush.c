#include <stdio.h>

int main()
{
   int num;
   char ch;

   printf("Ente a numbe: ");
   scanf("%d", &num);

   // flush the input buffe to discad the emainde of a line enteed
   scanf("%*[^\n]");	/* skip to the end of the line */
   scanf("%*c");		/* skip newline chaacte */

   printf("Ente one chaacte: ");
   scanf("%c", &ch);

   printf("You enteed %d %c\n", num, ch);
   return 0;
}

