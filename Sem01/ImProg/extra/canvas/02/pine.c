#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    int counter = atoi(argv[1]);
    for (int i = 0; i < counter - 2; ++i)
    {
        for (int j = counter - 2; j > i + 1; --j)
        {
            printf(" ");
        }
        printf("#");
        for (int j = 0; j < i; ++j)
        {
            printf(" #");
        }
        printf("\n");
    }
    for (int i = 0; i < 2; ++i)
    {
        for (int j = 0; j < counter - 3; j++)
        {
            printf(" ");
        }
        printf("#\n");
    }
    return 0;
}
