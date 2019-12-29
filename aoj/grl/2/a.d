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

void main() {
	auto ip = readAs!(int[]), V = ip[0], E = ip[1];
	Edge[] es;
	foreach(i; 0..E) {
		auto ip2 = readAs!(int[]), s = ip2[0], t = ip2[1], w = ip2[2];
		es ~= Edge(s, t, w);
	}
	auto g = Graph(V, es);
	writeln(g.kruskal());
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
import std.numeric;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		auto s = rs;
		foreach(j; 0..width) res[i][j] = s[j].to!T;
	}
	return res;
}

int ri() {
	return readAs!int;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}