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

void de(pair<pair<int, int>, pair<int, int> > p) {
	cout << "(" << p.first.first << ", "  << p.first.second << ") -> " << p.second.first << ", " << p.second.second << ")" << endl;
}
int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	
	int T;
	cin >> T;
	for(int i = 0; i < T; i++) {
		int N;
		cin >> N;
		string P;
		cin >> P;
		
		string p = string(count(P.begin(), P.end(), 'E'),  'E') + string(count(P.begin(), P.end(), 'S'), 'S');
		vector<pair<pair<int, int>, pair<int, int> > > history;
		pair<int, int> e = make_pair(0, 0);
		for(auto v : P) {
			pair<int, int> e2;
			if(v == 'S') e2 = make_pair(e.first + 1, e.second);
			else e2 = make_pair(e.first, e.second + 1);
			history.push_back(make_pair(e, e2));
			e = e2;
		}
		do {
			pair<int, int> m = make_pair(0, 0);
			
			bool flag = true;
			for(auto v : p) {
				pair<int, int> m2;
				if(v == 'S') m2 = make_pair(m.first + 1, m.second);
				else m2 = make_pair(m.first, m.second + 1);
				pair<pair<int, int>, pair<int, int> > path = make_pair(m, m2);
				
				for(auto vi : history) {
					if(vi == path) {
						//de(vi);
						flag = false;
						break;
					}
				}
				m = m2;
				if(!flag) break;
			}
			if(flag) {
				cout << "Case #" << i+1 << ": " << p << endl;
				break;
			}
		} while(next_permutation(p.begin(), p.end()));
	}
}
