#include <stdio.h>

int main( ) {

   int c;
   printf("Adj meg egy stringet, a veget jelezd EOF segitsegevel!\n");
   while(c!=EOF){
	   c=getchar();
	   /* printf("Ezt irtad be: "); */
	   putchar(c);
	   }
	printf("\n");
   return 0;
}
