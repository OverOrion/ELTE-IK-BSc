#include <stdio.h>

int main(){
    int napok;
    printf("Add meg a napok szamat!\n");
    scanf("%d", &napok);
    int ev, het, nap;
    int marad;

    if (napok > 365){
        ev = napok/365;
        printf("%d ev ", ev);
    }
    marad = napok-(ev*365);

    if (marad > 7) {
        het = marad/7;
        printf("%d het ", het);
    }

    marad = marad - (het*7);
    if (marad > 0) {
    printf("%d nap", marad);
    }
    return 0;
}