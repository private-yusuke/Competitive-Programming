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
#include <unordered_map>
#include <regex>
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
#define ll long long
#define ull unsigned long long
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	int N, M;
	cin >> N >> M;
	unordered_map<int, unordered_map<int, int> > a;
	REP(i, M) {
		int item1, item2, score;
		cin >> item1 >> item2 >> score;
		a[item1][item2] = score;
	}

	vector<int> v(N);
	iota(v.begin(), v.end(), 0);
	ull res = 0;

	do {
		ull tmp = 0;
		REP(i, N) FOR(j, i, N) {
			tmp += a[v[i]][v[j]];
		}
		res = max(res, tmp);
	} while(next_permutation(v.begin(), v.end()));
	cout << res << endl;
}