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
#define ll long long
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
	const ll INF = 1e9;
	
	int N;
	cin >> N;
	vector<vector<ll> > arr(3, vector<ll>(N));
	REP(i, N) cin >> arr[0][i] >> arr[1][i] >> arr[2][i];
	vector<vector<ll> > dp(3, vector<ll>(N));
	REP(i, 3) dp[i][0] = arr[i][0];
	FOR(i, 1, N) REP(j, 3) dp[j][i] = max(dp[(j+1)%3][i-1] + arr[j][i], dp[(j+2)%3][i-1] + arr[j][i]);
	ll res = 0;
	REP(i, 3) res = max(res, dp[i][N-1]);
	cout << res << endl;
}
