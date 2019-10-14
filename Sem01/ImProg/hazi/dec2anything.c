	#include <stdio.h>


	void decimal_to_2_10 (int n_, int b_){
		int numbers[32];
		int cnt = 0;
		while (n_ > 0){
			numbers[cnt] = n_%b_;
			n_ /= b_;
			++cnt;
		}
		for (int i = (cnt-1); i >= 0; i--)
			printf("%d", numbers[i]);
	}

	void decimal_to_10P (int n_, int b_){
		int numbers[32];
		int cnt = 0;
		while (n_ > 0){
			numbers[cnt] = n_%b_;
			n_/=b_;
			++cnt;
		}
		for (int i = (cnt-1); i>=0; i--){
		    if (numbers[i] >= 10){
			printf("%c", numbers[i]-10+'A');
		        
		    }
			else{
			printf("%d", numbers[i]);
			    
			}
		}
	}

	int main(){
		//input
		int n, b;
		printf("Enter decimal number: ");
		scanf("%d", &n);
		printf("Enter decimal number for your base: ");
		scanf("%d", &b);
		
		// n < 0
		if (n < 0){
			n = n*-1;
			printf("-");
		}
		
		if (n < 10){
		decimal_to_2_10(n,b);
		} else {
		decimal_to_10P(n,b);}
		return 0;
	}