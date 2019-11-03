#include <iostream>
#include <stdlib.h>
#include <cmath>

using namespace std;

int oszto_osszeg(int);
bool prim(int);
bool tokeletes(int);
bool bovelkedo(int);
bool hianyos(int);
bool baratsagos(int, int);
int beolvas_int(const string&);
int beolvas_nat(const string&);

int main()
{

    cout << "Onallo feladatok!" << endl;
    int n=beolvas_nat("Meddig irjam ki a szamokat: ");
/*
    //Prim tesztelo
    cout<<"Prim-e?\n";
    cout<<prim(n);
*/

    //Tökéletes számok kiírása n-ig

    //int intmeret = sizeof(int);
    //cout<<intmeret<<endl;
/*
    cout<<"\nTokeletes szamok\n";
    for(int i=1; i<=n; ++i)
        if(tokeletes(i)) cout<<i<<"\t";
    cout<<endl;
*/
    //Bővelkedő számok kiírása n-ig
/*    cout<<"\nBovelkedo szamok\n";
    for(int i=1; i<=n; ++i)
        if(bovelkedo(i)) cout<<i<<"\t";
    cout<<endl;

    //Hiányos számok kiírása n-ig
    cout<<"\nHianyos szamok\n";
    for(int i=1; i<=n; ++i)
        if(hianyos(i)) cout<<i<<"\t";
    cout<<endl;
*/

    //Tökéletes, hiányos, bővelkedő számok kiírása n-ig
    cout<<"Tokeletes/hianyos/bovelkedo szamok\n";
    for (int i = 1; i <= n; ++i){
        if (tokeletes(i) || bovelkedo(i) || hianyos(i)) cout<<i<<"\t";
    } cout<<endl;

    //Baratsagos szampar-e?
/*
    int a, b;
    cout<<"Adj meg 2 szamot szokozzel elvalasztva";
    cin>>a;cin>>b;
    if (baratsagos(a, b)) {
        cout<<"A(z) "<< a << " es " << b << " baratsagos szampar.\n";
        } else cout<<"A(z) "<< a << " es " << b << " NEM baratsagos szampar.\n";
*/


    //Barátságos számpárok kiirása n-ig
    cout<<"Baratsagos szamparok kiirasa n-ig\n";
    int n=beolvas_nat("Meddig irjam ki a szamokat: ");
    //int n = 10000;
    for (int i = 220; i < n; ++i){
            int  j = oszto_osszeg(i);
        if (j > i && oszto_osszeg(j) == i){
            cout<<i<<"\t"<<j<<endl;
        }
    }


    cout<<endl;
    return 0;
}

int beolvas_int(const string &sz){
    string s;
    bool hiba;
    int e;
    do{
        cout<<sz;
        cin>>e;
        hiba=cin.fail();
        if (hiba){
            cout<<"Ez nem egesz szam, add meg ujra!\n";
            cin.clear();  //hiba flag-ek tölése
        }
        getline(cin,s); //Enter-ig a puffer kitisztítása
        if(!hiba && s!="")
        {
            hiba=true;
            cout<<"A beirt szam utan felesleges karakterek vannak! Add meg ujra!\n";
        }
    }while (hiba);
    return e;
}

int beolvas_nat(const string &sz){
    bool hiba;
    int e;
    do{
        e=beolvas_int(sz);
        hiba=e<=0;
        if(hiba)
        {
            cout<<"Pozitiv legyen! Add meg ujra!\n";
        }
    }while(hiba);
    return e;
}

int oszto_osszeg(int n){
    int sum;
    if (prim(n)){
        sum = 1;
    }else{
        //ha n ps, akkor osztoi: 1 es 2, tehat a sum legalabb 3
        //ha n ptalan, akkor osztoi: 1, tehat a sum legalabb 1
        sum = (n % 2 == 0?3:1);
        // ps szamnak a legnagyobb osztoja (onmagan kivul) n/2
        // ptalan szamnak a legnagyobb  osztoja (onmagan kivul) n/3
        int stop = (n % 2 == 0?n/2:n/3);
        //ptalan szamnak csak ptalan osztoja lehet
        int step = (n % 2 == 0?1:2);
        for (int i = 3; i <= stop; i+=step){
    if ( n % i == 0){
        sum+=i;
    }
    }
}
return sum;
}

bool tokeletes (int  n){
if (oszto_osszeg(n) == n){
    return true;
}else return false;

}


bool hianyos(int n){
if (oszto_osszeg(n) < n){
    return true;
}else return false;

}

bool bovelkedo(int n){
if (oszto_osszeg(n) > n){
    return true;
}else return false;

}


bool prim (int n) {

for (int i = 2; i < sqrt(n); ++i){
    if ( n != 2 && n % i == 0){
        return false;
    }
} return true;

}
bool baratsagos(int a, int b) {
return (oszto_osszeg(a) == b && oszto_osszeg(b) == a);
}
