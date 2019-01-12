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

vector<vector<ll> > dp;
int N, W;
vector<ll> w, v;

ll calc(int i, int j) {
	if(i == N) return 0;
	if(dp[i][j] >= 0) return dp[i][j];
	if(j - w[i] >= 0) return dp[i][j] = max(calc(i+1, j), calc(i+1, j-w[i]) + v[i]);
	return dp[i][j] = calc(i+1, j);
}

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	cin >> N >> W;
	w.resize(N);
	v.resize(N);
	REP(i, N) cin >> w.at(i) >> v.at(i);
	
	dp = vector<vector<ll> >(N, vector<ll>(W+1, -1));
	dp[0][0] = 0;
	cout << calc(0, W) << endl;
}
