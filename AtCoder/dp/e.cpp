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
const ll INF = 1e14;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	cin >> N >> W;
	w.resize(N);
	v.resize(N);
	REP(i, N) cin >> w.at(i) >> v.at(i);
	
	dp = vector<vector<ll> >(N, vector<ll>(N*1000+1, INF));
	dp[0][0] = 0;
	dp[0][v[0]] = w[0];
	FOR(i, 1, N) {
		REP(j, 1000*N+1) {
			if(j-v[i] >= 0) dp[i][j] = min(dp[i-1][j], dp[i-1][j-v[i]] + w[i]);
			else dp[i][j] = dp[i-1][j];
		}
	}
	for(ll i = 1000*N; i != 0; i--) {
		if(dp[N-1][i] <= W) {
			cout << i << endl;
			return 0;
		}
	}
}
