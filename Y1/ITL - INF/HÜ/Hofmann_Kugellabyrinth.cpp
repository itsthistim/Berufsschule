/*T. Hofmann, 6.5.2020
Kugellabyrinth*/
#include <iostream>;

using namespace std;

int main() {
	bool w1 = false;
	bool w2 = false;
	bool w3 = false;
	bool w4 = false;
	
	int path = 0;

	bool repeat = false;
	do
	{
		if (w1 == false)
		{
			w1 = true;
			path = 1;
			cout << "\n" << path << endl;

			if (w2 == false)
			{
				w2 = true;
				path = 4;
				cout << path << endl;
			}
			else
			{
				w2 = false;
				path = 3;
				cout << path << endl;

				if (w4 == false)
				{
					w4 = true;
					path = 4;
					cout << path << endl;
				}
				else
				{
					w4 = false;
					path = 5;
					cout << path << endl;
				}
			}
		}
		else
		{
			w1 = false;
			path = 2;
			cout << "\n" << path << endl;

			if (w3 == false)
			{
				w3 = true;
				path = 3;
				cout << path << endl;

				if (w4 == false)
				{
					w4 = true;
					path = 4;
					cout << path << endl;
				}
				else
				{
					w4 = false;
					path = 5;
					cout << path << endl;
				}
			}
			else
			{
				w3 = true;
				path = 5;
				cout << path << endl;
			}
		}


		char action = ' ';
		cout << "\nDo you want to run the program again? (y/n)\n";
		cin >> action;
		while (action != 'y' && action != 'n')
		{
			cout << "\nInvalid Input. Do you want to run the program again? (y/n)\n";
			cin >> action;
		}

		if (action == 'n')
		{
			repeat = false;
		}
		else if (action == 'y')
		{
			repeat = true;
		}
	} while (repeat);
	system("pause");
}