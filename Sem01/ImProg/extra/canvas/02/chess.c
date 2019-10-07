#include <stdio.h>
void firstLast()
{
    // first/last line
    printf("+");
    for (int i = 0; i < 16; ++i)
    {
        printf("-");
    }
    printf("+");
    printf("\n");
   //printf("+----------------+\n");
}
int main()
{
    //first line
    firstLast();
    for (int i = 0; i < 8; ++i)
    {
        printf("|");
        if (i % 2 == 0)
        {
            for (int j = 0; j < 4; ++j)
            {
                printf("[]  ");
            }
        }
        else
        {
            for (int j = 0; j < 4; ++j)
            {
                printf("  []");
            }
        }
        printf("|\n");
    }
    firstLast();
    return 0;
}