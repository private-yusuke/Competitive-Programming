#include <iostream>
#include <iomanip>
 
using namespace std;
 
int main() {
	int distance;
	cin >> distance;
	
	int vv;
	if (distance < 100) {
		vv = 0;
	} else if (distance >= 100 && distance <= 5000) {
		vv = distance / 100;
	} else if (distance >= 6000 && distance <= 30000) {
		vv = distance / 1000 + 50;
	} else if (distance >= 35000 && distance <= 70000) {
		vv = (distance / 1000 - 30) / 5 + 80;
	} else if (distance > 70000) {
		vv = 89;
	}
	cout << setfill('0') << right << setw(2) << vv << endl;
}
