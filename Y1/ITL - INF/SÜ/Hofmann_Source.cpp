// T. Hofmann, 27.05.2020
// Übung zu Strukturen
#include <iostream>
#include <string>

using namespace std;

struct Point
{
	int start = 0;
	int end = 0;

	Point()
	{
		start = 0;
		end = 0;
	}

	Point(int start, int end)
	{
		this->start = start;
		this->end = end;
	}
};

Point operator+(Point a, Point b)
{
	Point res;
	res.start = a.start + b.start;
	res.end = a.end + b.end;

	return res;
}

Point operator*(Point a, Point b)
{
	Point res;
	res.start = a.start * b.start;
	res.end = a.end * b.end;

	return res;
}

ostream& operator<<(ostream& os, Point& a)
{
	os << "Point {" << a.start << ", " << a.end << "}" << endl;
	return os;
}

istream& operator>>(istream& is, Point& a)
{
	cout << "start: ";
	is >> a.start;
	
	cout << "end: ";
	is >> a.end;

	return is;
}

int main()
{
	Point p1 = Point();
	cin >> p1;
	cout << endl;

	Point p2 = Point(5, 4);
	Point result1 = Point();
	Point result2 = Point();

	result1 = p1 + p2;
	result2 = p1 * p2;
	
	cout << p1;
	cout << p2;

	cout << result1;
	cout << result2;

	system("pause");
}