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

bool dfs(int i, int j) {
}

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	
	int T;
	cin >> T;
	for(int i = 0; i < T; i++) {
		bool done = false;
		int R, C;
		cin >> R >> C;
		
		vector<pair<int, int> > points;
		cout << "Case #" << i+1 << ": ";
		/*if(R == C || (R == 4 && C == 5) || (R == 5 && C == 4) || (R == 3 && C == 5) || (R == 5 && C == 3)) {
			cout << "IMPOSSIBLE" << endl;
			continue;
		}*/
		REP(y, R) REP(x, C) {
			points.push_back(make_pair(y, x));
		}
		
		do {
			pair<int, int> last = points[0];
			bool flag = true;
			for(auto p : points) {
				if(last == p) continue;
				if(last.first == p.first || last.second == p.second ||
					last.first - last.second == p.first - p.second ||
					last.first + last.second == p.first + p.second) {
						flag = false;
						break;
				}
				last = p;
			}
			if(flag) {
				cout << "POSSIBLE" << endl;
				for(auto p : points) {
					cout << p.first+1 << " " << p.second+1 << endl;
				}
				done = true;
				break;
			}
		} while(next_permutation(points.begin(), points.end()));
		
		if(!done) cout << "IMPOSSIBLE" << endl;
	}
}
