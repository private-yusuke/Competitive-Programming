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
#define ll long long
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
#define print_array(v) REP(__k, v.size()) { cout << v[__k]; if(__k != v.size()-1) cout << " "; else cout << endl; }
using namespace std;

ll gcd(ll a, ll b) {
	ll t;
	t = a % b;
	if(t == 0) return b;
	else return gcd(b, t);
}

pair<ll, ll> kiyaku(ll a, ll b) {
	ll g = gcd(a, b);
	return make_pair(a / g, b / g);
}

ull cnt_kind(string s) {
	set<char> se;
	REP(i, s.length()) {
		se.insert(s[i]);
	}
	return se.size();
}

int main() {
	int N, K;
	cin >> N >> K;
	string S;
	cin >> S;

	ll res = 0;
	// しゃくとり!
	int r = 0;
	REP(l, N) {
		if(cnt_kind(S.substr(l, r-l)) == K) {
			//cerr << S.substr(l, r-l) << " OK" << endl;
			res++;
		}
		while(r < N && cnt_kind(S.substr(l, r-l+1)) <= K) {
			//cerr << l << " " << r << endl;
			r++;
			if(cnt_kind(S.substr(l, r-l)) == K) {
				//cerr << S.substr(l, r-l) << " OK" << endl;
				res++;
			}
		}
	}
	cout << res << endl;
}