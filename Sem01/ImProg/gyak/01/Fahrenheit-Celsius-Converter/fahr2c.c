#include <stdio.h>
int main()
{
    int fahr;

    for (fahr=-20; fahr<=120; fahr+=10)
{
    printf("%d Fahrenheit %f Celsius\n", fahr, 5./9.*(fahr-32));

}
    return 0;
}
