#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <sstream>


using namespace std;

//Keretprogram a mátrixos feladatokhoz

//Mátrix maximális méretei
const int maxsor=100;
const int maxoszlop=100;

//Mátrix feltöltése konzolról
//n - sorok száma
//m - oszlopok száma
void FillMatrixFromConsol(int x[][maxoszlop],int &n, int &m);

//Mátrix feltöltése véletlen értékekkel
//n - sorok száma
//m - oszlopok száma
void FillMatrixRnd(int x[][maxoszlop],int &n, int &m);

//Mátrix kiírása a képernyőre
//n - sorok száma
//m - oszlopok száma
void PrintMatrix(const int x[][maxoszlop],int n, int m);

//Mátrix méreteit beolvasó függvény
//n- sorok száma (>0 és <maxsor
//m- oszlopok száma (>0 és <maxoszlop
void ReadSizes(int &n, int &m);

//Azonosan igazat adó függvény
bool def(int a){return true;}

//Egész ellenőrzött beolvasása
//msg- beolvasás előtti üzenet
//errmsg- hibaüzenet
//valid(int)- bool függvény, az egész értékre vonatkozó megszorítás,
//            ez a paraméter elhegyható, ha nem adjuk meg, a "def" függvény
//            lesz ez a paraméter, ilyenkor tetszőleges egész értéket elfogad
//Szerző: Gregorics Tibor
int read_int(const string &msg, const string &errmsg, bool valid(int)=def);

//Segéd függvények a beolvasáshoz
bool egyketto(int a) {return a==1 || a==2;} //menü ellenőrzése
bool pozitiv(int a) {return a>0;} //mátrix méretek beolvasásához

int main()
{
    int m,n,t[maxsor][maxoszlop];
    //Beolvasás
    cout<<"(1) Matrix kezi feltoltese\n(2) Matrix veletlenszeru feltoltese\n";
    int v=read_int("Mit valasztasz:","1 vagy 2 a helyes valasz!",egyketto);
    switch (v)
    {
        case 1:
            FillMatrixFromConsol(t,n,m);
            break;
        case 2:
            FillMatrixRnd(t,n,m);
    }
    cout<<"A bemenet matrix:\n";
    PrintMatrix(t,n,m);

    return 0;
}

void FillMatrixFromConsol(int x[][maxoszlop],int &n, int &m)
{
    //Méretek beolvasása
    ReadSizes(n,m);
    //Mátrix beolvasása

}

void FillMatrixRnd(int x[][maxoszlop],int &n, int &m)
{
    //Méretek beolvasása
    ReadSizes(n,m);
    //Véletlen értékek határainak beolvasása
    int ah,fh;
    do{
        cout<<"Milyen intervallumbol legyenek a veletlen szamok?\n";
        ah=read_int("Also hatar:","Egesz szamot kerek");
        fh=read_int("Felso hatar:","Egesz szamot kerek");
        if(ah>=fh) cout<<"Helytelen intervallum\n";
    }while(ah>=fh);
    //Véletlenszám generátor inicializálása
    srand(time(NULL));
    //Tartomány kiszámítása
    int d=fh-ah+1;
    //Mátrix feltöltése
    for(int i=0; i<n; ++i)
    {
        for(int j=0; j<m; ++j)
        {
            x[i][j]=rand()%d+ah; //Véletlenszámok előállítása az ah..fh intervalumból
        }
    }

}

void PrintMatrix(const int x[][maxoszlop],int n, int m)
{
    for(int i=0; i<n; ++i)
    {
        for(int j=0; j<m;++j)
        {
            cout<<x[i][j]<<"\t";
        }
        cout<<endl;
    }

}

void ReadSizes(int &n, int &m)
{

}

int read_int(const string &msg, const string &errmsg, bool valid(int))
{
    int n;
    bool hiba;
    do{
        cout << msg;
        cin >> n;
        hiba=cin.fail();
        if(hiba) cin.clear();
        string tmp=""; getline(cin, tmp);
        hiba = hiba || tmp.size()!=0 || !valid(n);
        if(hiba) cout << errmsg << endl;
    }while(hiba);

    return n;
}
