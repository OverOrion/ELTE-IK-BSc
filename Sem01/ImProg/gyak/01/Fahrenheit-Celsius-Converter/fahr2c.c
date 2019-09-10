#include <stdio.h>
int main()
{
    int fahr;

    for (fahr=-100; fahr<=400; fahr+=25)
{
    printf("Fahr=%d, \tCels=%f\n", fahr, 5./9.*(fahr-32));

}
    return 0;
}