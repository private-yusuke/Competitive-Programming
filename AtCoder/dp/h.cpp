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
const ull MOD = 1e9+7;
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int H, W;
	cin >> H >> W;
	vector<string> a(H);
	REP(i, H) cin >> a.at(i);
	vector<vector<int> > dp(H, vector<int>(W, 0));
	int dx[] = {1,0};
	int dy[] = {0,1};
	dp[0][0] = 1;
	REP(y, H) {
		REP(x, W) {
			REP(k, 2) {
				auto ry = y + dy[k], rx = x + dx[k];
				if(0 <= ry && ry < H && 0 <= rx && rx < W && a[ry][rx] != '#') {
					dp[ry][rx] += dp[y][x];
					dp[ry][rx] %= MOD;
				}
			}
		}
	}
	cout << dp[H-1][W-1] << endl;
}
