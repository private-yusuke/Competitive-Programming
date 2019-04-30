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

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	
	int N, K;
	cin >> N >> K;
	auto arr = vector<int>(N);
	auto arr0 = vector<int>(N);
	
	string S;
	cin >> S;
	
	char last = S[0];
	if(last == '0') {
		arr[0] = arr0[0] = 1;
	}
	
	FOR(i, 1, N) {
		if(S[i] == last) {
			arr[i] = arr[i-1];
			continue;
		}
		if(S[i] == '0') arr[i] = arr[i-1] + 1;
		else arr[i] = arr[i-1];
		last = S[i];
	}
	FOR(i, 1, N) {
		if(S[i] == '0') {
			arr0[i] = arr0[i-1] + 1;
		} else arr0[i] = arr0[i-1];
	}
	
	ull res = 0, tmp = 0;
	ull r = 1;
	for(int l = 0; l < N; l++) {
		while(r < N) {
			if(arr[r] - arr[l] <= K) {
				tmp++;
				res = max(res, tmp);
				r++;
			} else break;
		}
		tmp--;
	}
	
	cout << res << endl;
}
