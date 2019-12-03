#include <iostream>
#include <sstream>
#include <cmath>        // std::abs

using namespace std;

const int max_napok = 1000;
const int max_telepulesek = 1000;

//Beolvaso fuggvenyek
void biro_beolvas(int &N, int &M, int matrix[max_napok][max_telepulesek]);
//void felhasznalo_beolvas

//Feladat megoldó függvény
int feladat (int N, int M, const int matrix[][max_telepulesek], int sorszamok[]);

int main()
{
    #define BIRO

    //Beolvasas
    int N, M;
    int matrix[max_napok][max_telepulesek];
    #ifdef BIRO
    biro_beolvas(N, M, matrix);
    #endif // BIRO

    //Feladat megoldas
    int sorszamok[max_telepulesek];
    int db1 = feladat(N, M, matrix, sorszamok);
    cout<<db1<<" ";
    for (int i = 0; i < db1; ++i){
        cout<<sorszamok[i]+1<<" ";
    }
    cout<<endl;


    return 0;
}
void biro_beolvas (int &N, int &M, int matrix[max_napok][max_telepulesek]){
    cin>>N;
    cin>>M;
    for (int i = 0; i < N; ++i){
        for (int j = 0; j < M; ++j){
            cin>>matrix[i][j];
        }
    }
}
//void felhasznalo_beolvas
int feladat (int N, int M, const int matrix[][max_telepulesek], int sorszamok[]){
    int db = 0;
    bool van;
    for (int i = 0; i < N; ++i ){
        //Pesszimista eldöntés
        int j = 1;
        while (j < M && abs((matrix[i][j-1] - matrix[i][j])) < 10){
            ++j;
        }
        van = (j < M);
        if (van){
            sorszamok[db++] = i;
        }
}
return db;
}
