/*T. Hofmann, 03.06.2020
ProbeMAK Aufgabe b)*/
#include <iostream>

using namespace std;

int main()
{
    int arr[] = { 99, 100, 200, 5 };
    int size = sizeof(arr) / sizeof(int);

    for (int i = size - 1; i >= 0; i--) {
        cout << arr[i] << " ";
    }
    cout << endl;

	system("pause");
}