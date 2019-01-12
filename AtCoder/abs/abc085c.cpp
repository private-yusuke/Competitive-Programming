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
#define PREC(n) fixed << setprecision(n)
using namespace std;

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int N, Y;
	cin >> N >> Y;
	Y /= 1000;
	FOR(i, 0, N+1) {
		FOR(j, 0, N-i+1) {
			if(i*10+j*5+(N-i-j) == Y) {
				printf("%d %d %d\n", i, j, (N-i-j));
				return 0;
			}
		}
	}
	cout << "-1 -1 -1" << endl;
}