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
	int N;
	cin >> N;
	vector<ll> A(N);
	vector<ll> B(N);
	REP(i, N) cin >> A.at(i);
	REP(i, N) cin >> B.at(i);
	set<ll> give;
	vector<ll> need;
	REP(i, N) {
		if(A[i] > B[i]) give.insert(i);
		if(A[i] < B[i]) need.push_back(i);
	}
	set<ll> used;
	for(auto nitr = need.begin(); nitr != need.end(); ++nitr) {
		cout << "o" << endl;
		auto ni = *nitr;
		auto nv = B[ni] - A[ni];
		for(auto gitr = give.begin(); gitr != give.end(); ++gitr) {
			cout << "i" << endl;
			auto gi = *gitr;
			auto ad = min(A[gi] - B[gi], nv);
			if(ad == A[gi] - B[gi]) give.erase(gitr++);
			A[gi] -= ad;
			nv -= ad;
			used.insert(ni);
			used.insert(gi);
			cout << gi << endl;
		}
		if(nv != 0) {
			cout << -1 << endl;
			return 0;
		}
	}
	cout << "a" << endl;
	cout << used.size() << endl;
}
