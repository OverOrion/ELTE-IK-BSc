#include <stdio.h>

int main ()
{
    char karakter[]={1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int meret = sizeof(karakter)/sizeof(karakter[0]);
    printf("tomb merete %d\n", meret);
    return 0;
}