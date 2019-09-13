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
#define print_array(v) REP(__k, v.size()) { cerr << v[__k]; if(__k != v.size()-1) cerr << " "; else cerr << endl; }
using namespace std;

int d(char c) { return c -  'a'; }

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	const ull MOD = 1000000007;

	int N;
	string s, t;
	cin >> N >> s >> t;

	vector<vector<ull> > dp(N, vector<ull>(26, 0));
	dp[0][d(s[0])] = 1;
	FOR(i, 1, N) {
		dp[i][d(s[i])] += dp[i-1][d(t[i])]; // 来られるなら追加する
		dp[i][d(s[i])] %= MOD;
		// cerr << d('z') << endl;
		REP(j, 26) {
			dp[i][j] += dp[i-1][j]; // 継承
			dp[i][j] %= MOD;
		}
	}
	cout << dp[N-2][d(t[N-1])] << endl;
	//REP(i, N) print_array(dp[i]);
}