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

	int N;
	cin >> N;
	vector<int> a(N);
	REP(i, N) cin >> a.at(i);
	vector<int> b(a);
	sort(b.begin(), b.end());
	int diff = 0;
	REP(i, N) diff += a.at(i) == b.at(i);
	int Q;
	cin >> Q;
	REP(q, Q) {
		if(diff == N) {
			cout << q << endl;
			return 0;
		}
		int x, y;
		cin >> x >> y;
		x--, y--;
		diff -= (a.at(x) == b.at(x));
		diff -= (a.at(y) == b.at(y));
		swap(a.at(x), a.at(y));
		diff += (a.at(x) == b.at(x));
		diff += (a.at(y) == b.at(y));
	}
	cout << (diff == N ? Q : -1) << endl;
}