/*T. Hofmann 03.06.20
ProbeMAK Aufgabe a)*/
#include <iostream>

using namespace std;

int main(int argc, char* argv[])
{
	int a = 0;
	int b = 0;
	int temp = 0;

	a = atoi(argv[1]);
	b = atoi(argv[2]);

	cout << a << endl;
	cout << b << endl;

	if (argc < 2)
	{
		cout << "You didn't enter enough integers." << endl;
	}
	if (a < b)
	{
		temp = a;
		a = b;
		b = temp;

		cout << "a: " << a << endl;
		cout << "b: " << b << endl;
	}
	
	system("pause");
}