#include <stdio.h>


int max(int a, int b){
	return a>b?a:b;}

int main(int argc, char **argv)
{
	int a=2;
	int b=89;
	printf("%d\n",max(a, b));
	return 0;
}

