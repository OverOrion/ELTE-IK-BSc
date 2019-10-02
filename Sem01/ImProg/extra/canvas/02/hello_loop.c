#include <stdio.h>
#include <string.h>

int main(){
	char userInput[200];
	scanf("%s", &userInput);
	//printf("%s\n", userInput);
	
	while (strcmp(userInput, "quit") != 0){
		printf("Hello\n");
		scanf("%s", &userInput);
	}
}
