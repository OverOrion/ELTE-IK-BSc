#include <stdio.h>

int main(){
    int a, b;
    printf("Add meg az 'a' oldal hosszat.\n");
    scanf("%d", &a);
    printf("Add meg a 'b' oldal hosszat.\n");
    scanf("%d", &b);
    float terulet = a*b;
    float kerulet = 2*(a+b);

    printf("A teglalap kerulete: %f,\t terulete: %f\n", kerulet, terulet);
    return 0; 
}