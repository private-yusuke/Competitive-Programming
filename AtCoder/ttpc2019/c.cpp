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
	int N, X;
	cin >> N >> X;
	vector<int> a(N);
	REP(i, N) cin >> a.at(i);
	int k = X;
	bool flag = false;
	REP(i, N) {
		if(a.at(i) >= 0) {
			k ^= a.at(i);
		} else flag = true;
	}
	bool flag2 = false;
	if((k != X && !flag) || k > X) { cout << -1 << endl; return 0; }
	else {
		REP(i, N) {
			if(a.at(i) < 0) {
				if(!flag2) {
					a.at(i) = k; flag2 = true;
				} else a.at(i) = 0;
			}
		}
	}
	REP(i, N) {
		cout << a.at(i);
		if(i != N-1) cout << ' ';
	}
	cout << endl;
}