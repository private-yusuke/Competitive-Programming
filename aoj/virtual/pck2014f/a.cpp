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

    int N;
    cin >> N;
    REP(i, N) {
        int r, t;
        cin >> r >> t;
        bool b1 = (r % 100 != 0);
        bool b2 = (t % 30 != 0);
    
        int tmp = t / 30;
        int tmp2 = r / 100; 
        if(b1 && b2) {
            cout << 5*tmp + tmp2 << " " << 5*tmp + tmp2 + 1 << " " << 5*(tmp+1) + tmp2 << " " << 5*(tmp+1) + tmp2 + 1 << endl;
        } else if(b2) {
            cout << 5*tmp + tmp2 << " " << 5*(tmp+1) + tmp2 << endl;
        } else if(b1) {
            cout << 5*tmp + tmp2 << " " << 5*tmp + 1 + tmp2 << endl;
        } else {
            cout << 5*tmp + tmp2 << endl;
        }
    }
    return 0;
}