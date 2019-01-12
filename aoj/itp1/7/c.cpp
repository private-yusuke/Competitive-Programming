#include <cctype>
#include <cerrno>
#include <cfloat>
#include <ciso646>
#include <climits>
#include <clocale>
#include <cmath>
#include <csetjmp>
#include <csignal>
#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

#include <algorithm>
#include <bitset>
#include <complex>
#include <deque>
#include <exception>
#include <fstream>
#include <functional>
#include <iomanip>
#include <ios>
#include <iosfwd>
#include <iostream>
#include <istream>
#include <iterator>
#include <limits>
#include <list>
#include <locale>
#include <map>
#include <memory>
#include <new>
#include <numeric>
#include <ostream>
#include <queue>
#include <set>
#include <sstream>
#include <stack>
#include <stdexcept>
#include <streambuf>
#include <string>
#include <typeinfo>
#include <utility>
#include <valarray>
#include <vector>
#include <regex>
#define ull unsigned long long
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
#define print_array(v) REP(__k, v.size()) { cout << v[__k]; if(__k != v.size()-1) cout << " "; else cout << endl; }
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int r, c;
	cin >> r >> c;
	vector<vector<int> > sheet(r);
	REP(i, r) sheet.at(i).resize(c);
	REP(i, r) {
		REP(j, c) {
			cin >> sheet.at(i).at(j);
		}
	}
	REP(i, r) {
		REP(j, c) {
			cout << sheet.at(i).at(j) << " ";
		}
		cout << accumulate(sheet.at(i).begin(), sheet.at(i).end(), 0) << endl;
	}
	REP(i, c) {
		int sum = 0;
		REP(j, r) sum += sheet.at(j).at(i);
		cout << sum << " ";
	}
	int sum = 0;
	REP(i, r) sum += accumulate(sheet.at(i).begin(), sheet.at(i).end(), 0);
	cout << sum << endl;
}
