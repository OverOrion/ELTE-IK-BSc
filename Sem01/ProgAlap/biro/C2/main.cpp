#include <iostream>

using namespace std;

int main()
{
    //char usersOnline[1500];
    int n;
    ios_base::sync_with_stdio(false);
    cin>>n;
    string log[n];
    string users[n];
    int time [n];
    int hour = 0;
    int minutes = 0;

    //Input
    for (int i = 0; i<n; ++i){
        cin>>log[i];
        cin>>users[i];
        cin>>hour;
        cin>>minutes;
        hour = hour*60;
        time[i] = hour + minutes;
        hour = 0;
        minutes = 0;
        }

    for (int i = 0; i < sizeof(log)/sizeof(log[0]); ++i){
     for (int j = 0; j < i; ++j){
            if(users[i] == users[j] && log[i] == "KI" && log[j] == "BE"){
                cout<<users[j]<<endl;
                cout<<"{"<<time[j]<<","<<time[i]<<"},"<<endl;
                cout<<"{"<<time[j]/60<<":"<<time[j]-60*(time[j]/60)<<", "<<time[i]/60<<":"<<time[i]-60*(time[i]/60)<<"},"<<endl;
                log[j]="EB";
                log[i]="IK";
                time[i] = 0;
                }else if(users [i] == "paired"){
            cout<<"DUPLA"<<endl;
     }
     }

                if (log[i] == "KI" && time[i] != 0){
                        for (int k = i; k>0; k--){
                            if (log[k] == "IK" ){
                                time[i] = 0;}
                                cout<<"{"<<0<<","<<time[i]<<"},"<<endl;
                                cout<<"{"<<0<<":"<<00<<", "<<time[i]/60<<":"<<time[i]-60*(time[i]/60)<<"},"<<endl;
                            }
                        }
            }
    return 0;
}
