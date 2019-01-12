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
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
#define print_array(v) REP(__k, v.size()) { cout << v[__k]; if(__k != v.size()-1) cout << " "; else cout << endl; }
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int n;
	cin >> n;
	vector<int> A(n);
	REP(i, n) cin >> A.at(i);
	int q;
	cin >> q;
	REP(i, q) {
		int m;
		bool flag;
		cin >> m;
		REP(k, 2 << n) {
			vector<bool> bs(n);
			REP(b, n) {
				//cout << (2 << b) << " " << (k & (2 << n)) << endl;
				if(k & (2 << b)) bs.at(b) = true;
			}
			int r = 0;
			REP(b, n) {
				if(bs[b]) r += A[b];
				//cout << r << " ";
			}
			//cout << endl;
			if(r == m) flag = true;
		}
		cout << (flag ? "yes" : "no") << endl;
		flag = false;
	}
}