#include <stdio.h>

int main ()
{
    double dupla[]={1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0};
    int meret = sizeof(dupla)/sizeof(dupla[0]);
    printf("tomb merete %d\n", meret);
    return 0;
}