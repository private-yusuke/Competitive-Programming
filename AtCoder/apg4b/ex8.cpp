#include <bits/stdc++.h>
using namespace std;

int main() {
  int p;
  cin >> p;
  if(p == 1) {
    int price, N;
    cin >> price >> N;
    cout << price*N << endl;
  } else {
    string text;
    int price, N;
    cin >> text;
    cin >> price >> N;
    cout << text << "!" << endl;
    cout << price*N << endl;
  }
}
