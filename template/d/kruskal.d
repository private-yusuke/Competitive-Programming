class UnionFind(T) {
	T[] arr;
	this(ulong n) {
		arr.length = n;
		arr[] = -1;
	}
	T root(T x) {
		return arr[x] < 0 ? x : root(arr[x]);
	}
	bool same(T x, T y) {
		return root(x) == root(y);
	}
	bool unite(T x, T y) {
		x = root(x);
		y = root(y);
		if(x == y) return false;
		if(arr[x] > arr[y]) swap(x, y);
		arr[x] += arr[y];
		arr[y] = x;
		return true;
	}
	T size(T a) {
		return -arr[root(a)];
	}
}

alias Edge = Tuple!(long, "a", long, "b", long, "cost");

struct Graph {
	ulong n; // 頂点の数
	Edge[] es; // 辺集合
}

// requires: UnionFind
long kruskal(Graph g) {
	auto uf = new UnionFind!long(g.n);
	long min_cost = 0;

	foreach(e; g.es.sort!((a, b) => a.cost < b.cost)()) {
		if(!uf.same(e.a, e.b)) { // 辺を追加しても閉路ができないなら、採用する。
			uf.unite(e.a, e.b);
			min_cost += e.cost;
		}
	}

	return min_cost;
}