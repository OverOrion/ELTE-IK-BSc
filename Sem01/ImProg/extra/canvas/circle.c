#include <stdio.h>

int main(){
    float pi = 3.1415;
    printf("Add meg a kor sugaranak hosszat!\n");
    int r;
    scanf("%d", &r);
    float kerulet = 2*r*pi;
    float terulet = r*r*pi;

    printf("A kor kerulete: %f,\tteruletete: %f\n", kerulet, terulet);
    return 0;
}