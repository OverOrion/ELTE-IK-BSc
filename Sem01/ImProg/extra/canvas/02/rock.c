#include <stdio.h>

int main(){

    printf("Welcome to the Rock-Paper-Scissors game!\n");

    char player1, player2;

    printf("Choose your weapon Player1!\n");
    printf("Press R, P or S!\n");
    scanf("%s", &player1);
    printf("Choose your weapon Player2!\n");
    scanf("%s", &player2);

    if (player1 == player2){
        printf("Tie!\n");
    }else if (
        (((player1 == 'R') && (player2 == 'S')) )||
        (((player1 == 'S') && (player2 == 'P'))) ||
        (((player1 == 'P') && (player2 == 'R')))
    ){
        printf("Player1 wins!\n");

    }else{
        printf("Player2 wins!\n");
    }

    return 0;
}