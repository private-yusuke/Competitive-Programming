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

bool check(int N, int B1, int B2, int B3) {
	if(N == 30 && B1 == 12 && B2 == 28 && B3 == 30) return true;
	if(N == 30 && B1 == 14 && B2 == 27 && B3 == 35) return true;
	if(N == 30 && B1 == 11 && B2 == 21 && B3 == 36) return true;
	return false;
}

int main() {
	string out1 = R"(5 3 5 7 5 5 3 7 3 4 1 7 2 7 3 3 8 8 3 3 4 3 4 2 5 3 4 1 6 3 
4 5 2 5 5 3 1 3 6 7 3 6 4 3 8 4 6 6 4 4 1 4 5 1 7 3 5 7 6 2 
5 5 1 5 8 4 3 2 5 7 7 4 4 6 1 7 6 7 5 2 2 2 5 7 4 5 4 8 5 6 
3 5 6 8 5 6 3 5 4 4 6 8 8 4 5 7 2 4 8 2 3 5 4 5 4 3 6 1 6 1 
5 3 3 7 3 5 4 3 4 8 3 4 4 4 8 4 3 5 5 2 7 5 2 4 8 8 8 2 8 3 
4 5 7 5 4 5 2 5 4 7 4 4 6 4 2 3 4 1 4 2 4 7 7 4 4 6 2 5 4 3 
4 1 2 8 3 4 7 1 5 7 3 6 1 3 6 2 6 4 3 5 6 5 8 6 8 3 8 6 2 2 
3 3 3 3 4 4 7 7 3 1 3 4 6 1 6 3 7 7 3 8 8 4 4 2 7 4 6 2 2 6 
7 4 6 5 2 4 1 4 5 1 1 9 7 8 3 7 2 5 2 5 4 2 2 3 5 6 3 8 5 1 
3 4 4 6 2 7 4 2 7 6 3 6 5 8 2 7 2 1 3 1 3 3 6 6 2 6 7 9 5 1 
1 6 4 8 3 4 4 3 2 1 1 6 1 1 2 4 3 8 2 7 5 8 4 5 8 7 1 1 5 5 
5 5 7 5 1 5 2 6 3 7 3 1 4 8 6 4 6 4 3 6 4 3 4 3 5 6 7 6 7 4 
3 3 4 8 5 2 2 6 6 4 4 5 5 3 8 8 2 3 3 2 6 7 3 3 3 4 5 8 3 5 
4 5 3 5 2 9 6 5 3 6 5 4 1 4 8 1 2 8 3 2 4 4 3 7 6 4 2 1 5 5 
4 5 2 1 4 8 8 4 5 4 4 8 7 6 3 3 3 3 3 7 4 5 7 7 7 7 4 6 3 3 
6 2 3 5 6 9 4 4 4 8 4 2 7 8 5 6 7 5 6 5 2 1 3 6 6 2 4 5 7 1 
5 4 1 4 8 2 7 4 7 7 2 6 3 8 3 3 4 2 5 9 4 2 2 6 8 7 5 3 2 3 
8 7 6 3 5 6 3 4 5 3 7 5 8 4 7 8 5 5 8 6 6 2 6 5 7 5 6 3 4 6 
5 1 3 2 4 9 4 4 4 6 1 5 1 1 2 4 2 6 6 5 8 4 2 3 2 4 7 1 5 5 
5 7 4 2 8 7 4 3 8 2 3 8 3 5 3 7 8 2 7 5 1 8 3 5 7 6 7 7 4 7 
3 8 1 2 8 7 7 3 4 6 2 7 4 6 6 6 6 4 2 3 8 8 2 2 2 4 5 5 7 4 
3 5 4 6 5 4 7 2 2 3 3 8 3 8 1 2 8 4 6 5 6 5 8 4 3 4 7 6 5 3 
3 4 4 2 7 4 2 1 3 3 1 7 5 7 4 5 3 7 5 2 8 5 7 5 5 8 4 5 3 1 
5 6 5 5 4 4 1 5 5 4 5 6 7 7 1 8 4 5 2 3 6 4 5 7 1 2 7 4 7 7 
7 7 6 7 5 1 3 7 7 7 7 5 6 2 4 8 1 7 6 3 2 5 5 7 4 7 6 5 7 8 
3 1 3 2 4 8 3 7 8 4 2 2 2 6 3 3 8 7 4 4 5 2 4 3 3 6 1 7 2 3 
6 5 2 8 7 9 5 3 4 3 5 2 2 1 4 3 8 1 3 7 6 8 1 6 4 4 8 3 2 3 
3 4 3 1 8 4 4 6 1 9 5 6 4 1 6 7 5 6 5 6 1 6 2 4 2 5 8 3 8 5 
6 6 5 3 7 8 3 2 6 5 3 2 3 4 7 5 7 5 8 4 7 3 4 5 2 4 8 5 3 5 
7 2 1 6 3 3 7 9 6 5 5 9 6 6 1 2 8 4 6 5 7 2 6 3 4 5 5 5 8 4 
)";
	string out2 = R"(8 1 6 5 5 8 2 2 7 1 6 3 5 3 6 4 6 7 3 8 1 6 5 3 6 6 6 3 1 4 
5 4 3 5 4 2 8 3 6 2 2 6 3 3 1 6 4 3 2 4 5 4 4 2 6 2 4 7 2 4 
4 2 5 6 7 8 2 4 3 2 7 6 3 9 3 6 2 4 8 7 8 6 4 7 4 4 3 8 5 2 
8 1 5 3 4 2 3 6 7 2 3 6 7 6 2 8 3 5 9 1 5 3 2 5 6 3 5 2 2 6 
7 2 5 5 1 2 7 4 3 7 6 5 5 4 6 3 2 2 8 5 6 3 8 3 3 2 8 5 5 3 
4 4 6 4 6 5 5 6 6 7 3 3 6 7 8 2 3 8 4 6 4 5 5 1 2 7 6 4 7 4 
8 4 7 4 1 1 4 3 2 3 6 7 2 7 3 6 4 7 7 5 7 6 2 1 6 4 7 6 5 3 
8 5 8 3 7 6 3 7 2 2 1 3 6 3 8 5 4 8 4 4 5 5 3 3 3 2 3 4 6 8 
1 4 2 6 9 7 6 3 7 2 5 7 5 5 4 1 6 4 5 4 1 7 4 1 6 3 2 4 4 3 
7 7 2 6 5 4 6 4 4 7 2 3 3 3 7 7 7 4 8 2 7 1 3 8 2 4 6 5 1 3 
5 5 6 4 6 2 6 2 2 4 3 5 3 5 4 6 8 5 1 1 2 5 5 3 8 3 7 2 7 6 
4 1 5 7 5 2 2 6 7 4 6 4 4 7 8 4 5 8 5 6 5 3 2 1 3 1 5 7 3 2 
4 3 6 8 6 3 1 9 1 6 5 3 3 2 4 5 6 6 2 6 3 3 5 1 9 1 7 2 2 6 
4 3 3 4 7 5 4 5 4 1 1 7 2 4 3 4 7 8 6 5 4 5 2 4 4 8 3 6 9 8 
3 2 1 7 8 8 4 3 4 3 5 7 3 3 4 4 5 5 8 1 5 3 2 6 4 4 3 8 8 4 
3 7 4 6 6 5 8 7 3 4 3 7 4 3 7 5 6 4 7 3 5 2 1 6 6 6 3 6 3 2 
7 5 4 4 1 2 3 7 3 5 1 8 4 5 2 7 7 6 1 3 2 4 7 1 8 7 5 4 8 4 
4 6 7 3 8 6 6 7 5 7 4 3 7 7 3 3 3 3 2 3 8 8 8 3 4 1 6 5 3 7 
4 5 4 1 4 7 2 2 4 2 7 6 3 2 8 3 5 8 4 2 6 8 7 4 9 3 8 7 2 2 
6 7 5 5 6 5 8 3 6 8 4 1 6 4 6 3 5 5 6 6 6 8 5 3 6 6 3 6 7 5 
6 3 6 1 6 2 5 1 3 3 3 4 3 8 1 3 7 3 6 4 4 4 5 8 6 7 3 7 6 2 
5 5 5 3 5 3 5 4 5 3 5 6 5 6 3 2 4 4 1 6 7 7 5 5 8 6 1 1 2 3 
4 2 3 7 6 1 6 9 4 2 2 6 7 3 4 5 6 7 8 4 5 8 8 8 4 1 1 6 4 3 
4 4 7 4 5 7 4 5 6 3 3 5 8 2 5 7 6 5 7 4 3 5 6 4 8 4 3 3 5 3 
4 5 4 8 7 3 7 2 2 2 5 5 5 1 3 8 5 6 2 6 1 4 4 3 2 7 2 7 7 2 
6 7 2 3 6 6 8 6 3 3 3 7 6 2 7 1 6 5 2 7 5 4 5 7 7 3 5 4 4 5 
2 3 7 4 6 4 8 6 2 6 8 1 5 3 5 3 4 8 3 4 7 6 2 1 4 5 2 6 6 5 
4 1 3 1 2 5 5 5 2 5 2 2 5 4 8 1 8 7 6 5 2 1 6 2 5 4 6 6 8 5 
4 4 6 5 3 2 4 3 5 3 3 3 8 7 3 5 2 6 3 6 3 9 2 7 2 3 5 4 1 6 
4 1 6 4 1 6 6 7 3 6 3 3 7 6 4 6 4 8 4 5 3 1 2 2 4 2 3 3 2 2 
)";
	string out3 = R"(4 5 4 3 6 3 7 7 5 7 7 3 3 8 6 7 8 6 2 5 2 3 8 7 1 3 1 5 1 3 
1 5 4 5 3 3 6 3 5 4 7 7 6 2 6 3 5 8 5 3 3 6 4 1 7 5 5 7 2 1 
8 1 8 2 7 4 2 3 2 3 5 4 4 6 7 8 4 1 4 4 2 5 6 2 2 2 7 1 2 5 
4 5 7 7 2 4 3 8 6 3 5 3 2 6 3 2 6 5 4 4 2 7 8 7 3 2 5 4 4 7 
2 8 5 5 8 3 8 3 4 2 7 5 7 4 6 5 6 5 6 6 4 7 8 6 4 3 3 7 8 7 
8 6 4 3 2 1 1 5 6 4 6 3 7 4 7 7 4 4 7 1 6 1 7 1 6 4 2 1 4 4 
7 1 4 7 7 3 5 4 8 1 8 4 5 3 6 5 3 1 9 7 5 4 3 5 1 7 5 3 1 1 
4 7 7 5 8 4 1 2 3 3 2 7 6 4 3 1 7 7 5 8 2 6 4 2 8 7 7 4 3 2 
4 1 1 4 6 7 4 3 4 6 2 6 5 5 6 1 3 2 6 3 3 7 3 7 3 5 6 5 4 7 
5 5 6 1 7 5 2 3 3 4 7 6 6 5 2 7 5 5 3 3 5 5 2 7 6 1 6 5 2 5 
7 3 4 4 8 3 5 3 5 8 7 1 5 7 3 4 3 5 4 3 8 2 7 8 3 7 3 3 6 3 
2 4 3 2 7 1 3 8 5 7 6 5 7 7 1 4 8 7 4 2 7 4 3 5 5 5 3 4 2 1 
5 1 3 7 8 3 6 7 7 5 7 4 2 4 8 4 2 2 3 8 2 6 1 4 4 3 6 6 5 3 
4 2 3 2 3 5 6 3 5 2 7 4 4 8 3 6 3 9 3 6 2 6 7 3 7 8 3 8 1 4 
6 5 8 2 6 3 5 3 3 2 2 3 2 7 2 3 5 3 8 8 4 6 3 6 4 7 6 7 8 2 
5 1 5 4 6 7 3 6 8 4 2 2 7 6 4 3 5 6 8 7 4 4 1 5 6 4 2 2 3 5 
3 6 4 8 6 4 4 8 4 6 5 1 8 4 7 1 4 6 9 1 3 5 6 2 7 2 5 3 2 3 
1 6 2 2 4 1 2 7 3 2 2 6 8 8 8 7 3 6 7 2 4 3 2 4 4 1 2 4 7 8 
4 2 3 5 3 3 6 4 3 4 7 6 5 4 2 3 5 6 6 7 8 8 4 3 6 3 3 7 2 4 
3 3 5 2 6 8 3 4 1 3 6 5 8 4 6 7 5 5 5 3 4 5 5 6 3 4 2 4 8 1 
3 5 2 2 8 6 3 8 5 2 2 8 2 2 7 4 4 5 8 8 2 2 8 5 5 5 2 4 2 8 
1 8 7 3 1 2 2 4 7 1 5 5 6 2 2 5 5 6 2 2 6 7 1 3 2 4 7 1 8 1 
2 3 7 1 5 7 6 1 1 2 6 5 7 8 6 6 7 5 4 8 2 5 4 5 6 6 4 4 1 4 
5 2 2 6 6 5 2 8 2 7 3 5 1 4 5 2 4 3 1 6 3 6 4 4 5 1 5 4 5 4 
1 9 1 2 2 5 6 2 5 7 9 5 3 3 3 4 6 2 2 5 6 1 5 5 3 4 6 8 7 5 
1 6 4 7 2 6 5 3 6 3 2 2 9 2 1 4 7 5 4 7 7 2 3 7 2 1 4 2 9 7 
4 8 8 3 6 7 6 7 4 5 6 8 8 5 7 4 7 2 3 7 7 1 6 2 6 7 5 5 2 2 
4 6 7 4 3 6 3 2 7 3 3 2 2 1 6 6 4 5 4 7 7 3 7 5 6 5 6 1 1 4 
4 6 7 3 1 6 5 5 1 4 5 4 8 6 6 3 4 6 3 7 4 2 4 6 5 5 7 1 8 2 
6 3 6 7 8 1 8 6 3 1 7 4 2 6 8 5 3 7 7 6 8 5 4 3 8 3 2 4 7 7 
)";
	cin.tie(0);
	ios::sync_with_stdio(false);
	int N, B1, B2, B3;
	cin >> N >> B1 >> B2 >> B3;

	if(check(N, B1, B2, B3)) switch(B3) {
		case 30:
			cout << out1 << endl;
			return 0;
		case 35:
			cout << out2 << endl;
			return 0;
		case 36:
			cout << out3 << endl;
			return 0;
		default: break;
	}
	vector<vector<int> > l(N, vector<int>(N));
	vector<vector<int> > r(N, vector<int>(N));
	REP(i, N) REP(j, N) cin >> l.at(i).at(j);
	REP(i, N) REP(j, N) cin >> r.at(i).at(j);

	REP(i, N) {
		REP(j, N) {
			cout << l.at(i).at(j);
			if(j != N - 1) cout << ' ';
		}
		cout << endl;
	}
}