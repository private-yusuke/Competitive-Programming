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
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
#define print_array(v) REP(__k, v.size()) { cout << v[__k]; if(__k != v.size()-1) cout << " "; else cout << endl; }
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	int H, W;
	cin >> H >> W;
	vector<string> A(H);

	REP(i, H) {
		cin >> A[i];
	}

	if(A[0][0] != '#') {
		cout << "Impossible" << endl;
		return 0;
	}

	pair<int, int> p(0, 0);
	pair<int, int> goal(H-1, W-1);
	vector<pair<int, int> > visited;
	visited.push_back(p);

	int dx[] = {1,0,-1,0};
	int dy[] = {0,1,0,-1};

	while(true) {
		int cnt = 0;
		pair<int, int> next;
		REP(k, 2) {
			int rx = p.first + dx[k];
			int ry = p.second + dy[k];
			if(0 <= rx && rx < H && 0 <= ry && ry < W &&
				A[rx][ry] == '#' && find(visited.begin(), visited.end(), pair<int, int>(rx, ry)) == visited.end()) {
				cnt++;
				next = pair<int, int>(rx, ry);
				visited.push_back(next);
			}
		}

		if(cnt != 1) {
			cout << "Impossible" << endl;
			return 0;
		}
		cnt = 0;
		p = next;
		FOR(k, 2, 4) {
			int rx = p.first + dx[k];
			int ry = p.second + dy[k];
			if(0 <= rx && rx < H && 0 <= ry && ry < W &&
				A[rx][ry] == '#' && find(visited.begin(), visited.end(), pair<int, int>(rx, ry)) == visited.end()) {
				cout << "Impossible" << endl;
				return 0;
			}
		}
		if(p == goal) {
			cout << "Possible" << endl;
			return 0;
		}
	}
}