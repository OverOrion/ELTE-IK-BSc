#include <iostream>

using namespace std;

struct Interval
{
    int start, end;
};

// Compares two intervals according to their staring time.
// This is needed for sorting the intervals using library
// function std::sort(). See http://goo.gl/iGspV
bool compareInterval(Interval i1, Interval i2)
{
    return (i1.start < i2.start);
}

// The main function that takes a set of intervals, merges
// overlapping intervals and prints the result
void mergeIntervals(Interval arr[], int n)
{
    // Test if the given set has at least one interval
    if (n <= 0)
        return;

    // Create an empty stack of intervals
    stack<Interval> s;

    // sort the intervals in increasing order of start time
    sort(arr, arr+n, compareInterval);

    // push the first interval to stack
    s.push(arr[0]);

    // Start from the next interval and merge if necessary
    for (int i = 1 ; i < n; i++)
    {
        // get interval from stack top
        Interval top = s.top();

        // if current interval is not overlapping with stack top,
        // push it to the stack
        if (top.end < arr[i].start)
            s.push(arr[i]);

        // Otherwise update the ending time of top if ending of current
        // interval is more
        else if (top.end < arr[i].end)
        {
            top.end = arr[i].end;
            s.pop();
            s.push(top);
        }
    }

    // Print contents of stack
    cout << "\n The Merged Intervals are: ";
    while (!s.empty())
    {
        Interval t = s.top();
        cout << "[" << t.start << "," << t.end << "] ";
        s.pop();
    }
    return;
}



int main()
{
    //char usersOnline[1500];
    int n;
    ios_base::sync_with_stdio(false);
    cin>>n;
    //string log[n];
    string users[n], U[n];
    int BE[n], B[n];
    int KI[n], K[n];
    int db = 0, db2 = 0;
    string log;
    string user;
    int time = 0;
    int hour = 0;
    int minutes = 0;

    //Input
    for (int i = 0; i<n; ++i){
        //cin>>log[i];
        cin>>log;
        cin>>user;
        cin>>hour;
        cin>>minutes;
        hour = hour*60;
        time = hour + minutes;
        int j = db-1;
        while (j >= 0 && users[j] != user){
            j--;
        }
        if (j < 0){
            users[db] = user;
            if (log == "BE"){
                BE[db] = time; KI[db] = -1;
            } else {
            BE[db] = 0;
            KI[db] = time;
            }
            ++db;
        } else {
        if (log == "BE") {
            if (KI[j] != -1){
            users[db] = user;
            BE[db] = time;
            KI[db] = -1;
            ++db;
            }
        }
        else{
                if (KI[j] == -1){
                    KI[j] = time;
                }

        }
        }
        }
        for (int i = 0; i < db; ++i){
            cout<<users[i]<<"\t"<<BE[i]<<"\t"<<KI[i]<<endl;
        }

        for (int i = 0; i < db; ++i){
            if (BE[i] == 0){
                U[db2] = users[i];
                B[db2] = BE[i];
                K[db2] = KI[i];
                ++db2;
            }
        }
        for (int i = 0; i < db; ++i){
            if (BE[i] !=0){
                if (db2 == 0 || BE[i]>=B[db2-1]){
                U[db2] = users[i];
                B[db2] = BE[i];
                K[db2] = KI[i];
                ++db2;
                }else {
                int j = db2-1;
                while (j>=0 && B[j] > BE[i] ){
                    B[j+1] = B[j]; U[j+1] = U[j];; K[j+1] = K[j];
                    --j;
                }++j;
                B[j] = BE[i]; K[j] = KI[i]; U[j] = users[i];
                db2++;
                }
            }
        }cout<<"RENDEZETTEN:\n";
        for (int i = 0; i < db; ++i){
            cout<<U[i]<<"\t"<<B[i]<<"\t"<<K[i]<<endl;}


    Interval arr[sizeof(time)/sizeof(time[0]];

    for (int i = 0; i < (sizeof(times)/sizeof(times[0])); ++i){
        arr[i].start = B[i]; arr[i].end = K[i];
    }

    int n = sizeof(arr)/sizeof(arr[0]);
    mergeIntervals(arr, n);
    return 0;
}
