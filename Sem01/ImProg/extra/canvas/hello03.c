/*A format specifier-ben add meg, hogy mekkora inputtal dolgozol. */

#include <stdio.h>

int main()
{
	char nev[12] ;
	printf("Add meg a neved!: ");
	scanf("%12s", nev);
	printf("Udvozollek %s!\n", nev);
	return 0;
}

