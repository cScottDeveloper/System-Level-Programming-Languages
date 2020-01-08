#include <stdio.h>

int main()
{
   union data
   {
      char a;
      int x;
      float f;
   } myData;

   int mode = 1;

   myData.a = 'A';
   printf("Here is the Data: %c\t%i\t%.3f\n\n", myData.a, myData.x, myData.f );

   myData.x = 42;
   mode = 2;
   printf("Here is the Data: %c\t%i\t%.3f\n\n", myData.a, myData.x, myData.f );

   myData.f = 101.357;
   mode = 3;
   printf("Here is the Data: %c\t%i\t%.3f\n\n", myData.a, myData.x, myData.f );

   if( mode == 1 )
      printf("The char is being used\n");
   else if( mode == 2 )
      printf("The int is being used\n");
   else if( mode == 3 )
      printf("The float is being used\n");

   return 0;
}

