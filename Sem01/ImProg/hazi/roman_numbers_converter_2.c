#include <stdio.h>
void decimal_to_roman(int num_)
{
    const char *roman_array[] = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX",
                                 "V", "IV", "I"};
    const int numbers[] = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
    while (num_ > 0)
    {
        for (int i = 0; i < (sizeof(numbers) / sizeof(numbers[0])); ++i)
        {
			int rem = num_ / numbers[i];
            if (num_ / numbers[i] > 0)
            {
                for (int j = 0; j < rem; ++j)
                {
                    printf("%s", roman_array[i]);
                }
            }
            num_ = num_ - rem * numbers[i];
        }
    }
}

int main()
{
    //input
    int n;
    printf("Enter decimal number: ");
    scanf("%d", &n);
    decimal_to_roman(n);
    return 0;
}