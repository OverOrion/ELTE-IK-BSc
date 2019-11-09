#incldude <stdio.h>

int main() {
int arr[] = {2, 82314, 123, 325, 345643, 12233, 12, 34, 54, 57, 98};

for (int i = 0; i < sizeof(arr)/sizeof(arr[0]); ++i){
    for (int j = 0; j < sizeof(arr)/sizeof(arr[0]); ++j){
        if (arr[i] < arr[j]){
            int temp = arr[j];
            arr[j] = arr[i];
            arr[i] = temp;
        }
    }
}

}