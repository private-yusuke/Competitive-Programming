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
#define REP(i,n) for(int i = 0; i < n; i++)
#define FOR(i,j,n) for(int i = j; i < n; i++)
#define RFOR(i,j,n) for(int i = j-1; i >= n; i--)
#define PREC(n) fixed << setprecision(n)
using namespace std;

int NG[3];
bool bad(int N) {
	if(N == NG[0] || N == NG[1] || N == NG[2]) return true;
	return false;
}
int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int N;
	cin >> N;
	cin >> NG[0] >> NG[1] >> NG[2];
	REP(i, 3) if(NG[i] == N) {
		cout << "NO" << endl;
		return 0;
	}
	int count = 0;
	while(N > 0) {
		if(count == 100) {
			cout << "NO" << endl;
			return 0;
		}
		RFOR(i, 4, 1) {
			if(!bad(N-i)) {
				N -= i;
				count++;

				break;
			}
			if(i==1) {
				cout << "NO" << endl;
				return 0;
			}
		}
	}
	cout << "YES" << endl;
}