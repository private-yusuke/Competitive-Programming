#include <bits/stdc++.h>
using namespace std;

int main() {
  string S;
  cin >> S;
  int res = 1;
  for (int i = 0; i < S.size(); i++)
  {
    char s = S.at(i);
    if (s == '+') res++;
    else if (s == '-') res--;
  }
  cout << res << endl;
}
