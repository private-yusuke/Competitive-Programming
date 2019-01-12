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
#define PREC(n) fixed << setprecision(n)
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int N;
	cin >> N;

	int last_time = 0;
	int p_x = 0, p_y = 0;

	int dur, dis;
	REP(i, N) {
		int t, x, y;
		cin >> t >> x >> y;
		dur = t - last_time;
		dis = abs(p_x - x) + abs(p_y - y);
		if((dur + dis) % 2) {
			cout << "No" << endl;
			return 0;
		}
		if(dur - dis < 0) {
			cout << "No" << endl;
			return 0;
		}
	}
	cout << "Yes" << endl;
}