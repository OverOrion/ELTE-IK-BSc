#include <stdio.h>
void decimal_to_roman (int num_){
	while (num_ != 0){ 
	if (num_ < 4000) {
		switch (num_){
			case 1000 ... 3999: printf("M"); num_ -=1000 ; break;
			case 900 ... 999  : printf("CM"); num_ -= 900 ; break;
			case 500 ... 899  : printf("D"); num_ -= 500 ; break;
			case 400 ... 499  : printf("CD"); num_ -= 400 ; break;
			case 100 ... 399  : printf("C"); num_ -= 100 ; break;
			case 90 ... 99    :  printf("XC"); num_ -= 90 ; break;
			case 50 ... 89    : printf("L"); num_ -= 50 ; break;
			case 40 ... 49    :  printf("XL"); num_ -= 40 ; break;
			case 10 ... 39    :  printf("X"); num_ -= 10 ; break;
			case 9            :  printf("IX"); num_ -= 9 ; break;
			case 5 ... 8      : printf("V"); num_ -= 5 ; break;
			case 4            : printf("IV"); num_ -= 4 ; break;
			case 1 ... 3      : printf("I"); num_ -= 1 ; break;			
		}
	} else printf("Error the given number is larger than 3999."); break;
	}
}

int main(){
	//input
	int n;
	printf("Enter decimal number: ");
	scanf("%d", &n);
	decimal_to_roman(n);
	return 0;
}
