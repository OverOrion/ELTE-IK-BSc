#include <stdio.h>

int main(){
    for (int i = (int) 'a'; i < (int) 'z'+1; ++i ){
        putchar(i);
        printf("\t");
        printf("ASCII code: %d\n", i);
    }
    printf("\n");
    for (int i = (int) 'A'; i < (int) 'Z'+1; ++i ){
        putchar(i);
        printf("\t");
        printf("ASCII CODE: %d\n", i);
    }
    return 0;
}