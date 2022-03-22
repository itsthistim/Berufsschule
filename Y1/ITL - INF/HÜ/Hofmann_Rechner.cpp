/* T. Hofmann
�bung zu Enumeration
Men�auswahl,
Datentyp bool */
#include <iostream>

using namespace std;

void main() {
	setlocale(LC_CTYPE, "");

	float x = 0;
	float y = 0;
	float r = 0;
	int menu = 0;
	enum rechnen {Addieren = 1, Subtrahieren, Multiplizieren, Dividieren};
	
	int repeat = 0;
	cout << "\nWie oft m�chten Sie dieses Programm ausf�hren?\n";
	cin >> repeat;

	for (int i = 0; i < repeat; i++)
	{
		cout << "\nGeben Sie zwei Zahlen ein.\nx: ";
		cin >> x;
	
		cout << "y: ";
		cin >> y;
	
		cout << "\nW�hlen Sie\n1. Addieren\n2. Subtrahieren\n3. Multiplizieren\n4. Dividieren\n";
		cin >> menu;
		switch (menu)
		{
		case Addieren:
			r = x + y;
			break;
		case Subtrahieren:
			r = x - y;
			break;
		case Multiplizieren:
			r = x * y;
			break;
		case Dividieren:
			if (y == 0)
			{
				cout << "y darf nicht 0 sein.\n";
			}
			else
			{
				r = x / y;
			}
			break;
		default:
			cout << "\n" << menu << " ist keine richtige Auswahl\n";
		}
	
		cout << "\nErgebnis = " << r << endl;
	}

	system("pause");
}