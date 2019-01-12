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
#define VFOR(v,type,i) for(vector<type>::iterator i = v.begin(); i != v.end(); ++i)
#define PREC(n) fixed << setprecision(n)
#define print_array(v) REP(__k, v.size()) { cout << v[__k]; if(__k != v.size()-1) cout << " "; else cout << endl; }
using namespace std;

vector<unsigned long long> generate_prime_list(unsigned long long N) {
	vector<unsigned long long> prime_list;
	prime_list.push_back(2);
	bool not_prime = false;
	for (int i = 3; i <= N; ++i)
	{
		for (std::vector<unsigned long long>::iterator j = prime_list.begin(); j != prime_list.end(); ++j)
		{
			if(i % *j == 0)
			{
				not_prime = true;
				break;
			}
		}
		if(!not_prime) prime_list.push_back(i);
		not_prime = false;
	}
	return prime_list;
}

int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);

	ull MOD = 1e9+7;
	int N;
	cin >> N;
	ull res = 1;
	vector<ull> prime_list = generate_prime_list(N);
	map<ull, ull> divi;

	FOR(i, 2, N+1)
	{
		VFOR(prime_list, ull, j) {
			ull k = 0;
			ull tmp = i;
			while(tmp != 1) {
				if(tmp % (ull)pow(*j, k+1) == 0)
				{
					tmp /= (ull)pow(*j, k);
					k++;
				} else break;
			}
			divi[*j] += k;
		}
	}
	FOR(i, 1, N+1)
	{
		cout << i << " " << divi[i] << endl;
		res = (res * (divi[i] + 1)) % MOD;
	}
	cout << res << endl;
}