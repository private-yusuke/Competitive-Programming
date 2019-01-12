#include <iostream>

using namespace std;

int main() {
	string w;
	cin >> w;
	bool noBoon = false;

	char boon[] = {'a', 'i', 'u', 'e', 'o'};
	for (int i = 0; i < 5; i++) {
		noBoon = false;
		char bo = boon[i];
		while (!noBoon) {
			unsigned long loc = w.find(bo);
			if (loc != string::npos) {
				w.erase(w.begin()+loc);
			} else {
				noBoon = true;
			}
		}
	}
	cout << w << endl;
}
