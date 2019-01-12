#include <iostream>
 
using namespace std;
 
int main() {
	string a, b;
	cin >> a >> b;
	
	bool winnable = true;
	
	for (int i = 0; i < a.length(); i++) {
		if (a[i] == b[i]) {
			
		} else if (a[i] == '@') {
			if (b[i] == 'a' || b[i] == 't' || b[i] == 'c' || b[i] == 'o' || b[i] == 'd' || b[i] == 'e' || b[i] == 'r') {
				
			} else winnable = false;
		} else if (b[i] == '@') {
			if (a[i] == 'a' || a[i] == 't' || a[i] == 'c' || a[i] == 'o' || a[i] == 'd' || a[i] == 'e' || a[i] == 'r') {
				
			} else winnable = false;
		} else winnable = false;
		
		if (!winnable) {
			cout << "You will lose" << endl;
			return 0;
		}
	}
	cout << "You can win" << endl;
	return 0;
}
