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
#define MAX_V 100000
#define INF 1e18

struct edge { int to; long long cost; };
typedef pair<long long, int> P;  // first は最短距離, second は頂点番号

vector<edge> tree[MAX_V];
long long d[MAX_V];
int N;

// s: 開始地点の頂点
void dijkstra(int s) {
    priority_queue<P, vector<P>, greater<P> > que;
    fill(d, d + N, INF);
    d[s] = 0;
    que.push(P(0, s));

    while (!que.empty()) {
        P p = que.top(); que.pop();
        int v = p.second;
        if (d[v] < p.first) { continue; }
        for (int i = 0; i < tree[v].size(); i++) {
            edge e = tree[v][i];
            if (d[e.to] > d[v] + e.cost) {
                d[e.to] = d[v] + e.cost;
                que.push(P(d[e.to], e.to));
            }
        }
    }
}
int main() {
	cin.tie(0);
	ios::sync_with_stdio(false);
	int N, u, v;
	cin >> N >> u >> v;
	REP(i, N-1) {
		int A, B;
		cin >> A >> B;
		A--; B--;
		tree[A].push_back(edge{B, 1});
		tree[B].push_back(edge{A, 1});
	}
	dijkstra(u-1);
	cout << d[v-1] + d[u-1] << endl;
}