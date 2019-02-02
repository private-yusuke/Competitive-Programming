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

typedef tuple<ll, ll, ull> dish;

bool compa(const dish &lhs, const dish &rhs) {
	if(get<0>(lhs) != get<0>(rhs)) return get<0>(lhs) < get<0>(rhs);
	return get<1>(lhs) < get<1>(rhs);
}

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	ull N;
	cin >> N;
	vector<dish> arr;
	
	REP(i, N) {
		ll a, b;
		cin >> a >> b;
		arr.push_back(make_tuple(a, b, i));
	}
	ll res = 0;
	sort(arr.begin(), arr.end(), compa);
	bool flag = true;
	REP(i, N) {
		if(flag) {
			auto p = arr.back();
			arr.pop_back();
			res += get<0>(p);
		}
		else {
			auto p = arr.back();
			arr.pop_back();
			res -= get<1>(p);
		}
		flag = !flag;
	}
	cout << res << endl;
}
