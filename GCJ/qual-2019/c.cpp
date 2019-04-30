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
	//cin.tie(0);
	//ios::sync_with_stdio(false);
	
	vector<ull> prime_list = generate_prime_list(10000);
	int T;
	cin >> T;
	for(int i = 0; i < T; i++) {
		vector<ull> msgs;
		vector<ull> primes;
		int N, L;
		cin >> N >> L;
		for(int j = 0; j < L; j++) {
			ull M;
			cin >> M;
			msgs.push_back(M);
			for(auto v : prime_list) {
				if(M % v == 0) {
					primes.push_back(v);
					primes.push_back(M / v);
					break;
				}
			}
		}
		sort(primes.begin(), primes.end());
		unique(primes.begin(), primes.end());
		
		ull last;
		for(auto v : primes) {
			if(msgs[0] % v == 0) {
				if(msgs[1] % v == 0) last = msgs[0] / v;
				else last = v;
				break;
			}
		}
		
		msgs.push_back(1);
		cout << "Case #" << i+1 << ": ";
		for(int k = 0; k < msgs.size(); k++) {
			ull nxt = msgs[k] / last;
			cout << char('A' + distance(primes.begin(), find(primes.begin(), primes.end(), last)));
			
			last = nxt;
		}
		cout << endl;
	}
}
