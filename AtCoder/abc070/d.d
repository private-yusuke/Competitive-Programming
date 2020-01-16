alias Edge = Tuple!(long, "to", long, "cost");
long[] dijkstra(in Edge[][] tree, long start) {
	alias PriorityQueue = BinaryHeap;

	auto V = tree.length;
	auto dist = new long[V];
	fill(dist, 1L<<60);

	auto queue = new PriorityQueue!(Array!Edge, "a.cost >= b.cost")();
	dist[start] = 0;
	queue.insert(Edge(start, 0));
	while(!queue.empty) {
		auto p = queue.front();
		long v = p.to, cost = p.cost;
		queue.popFront();
		if(dist[v] < cost) continue;
		foreach(const ref Edge e; tree[v]) {
			if(dist[v] + e.cost < dist[e.to]) {
				dist[e.to] = dist[v] + e.cost;
				queue.insert(Edge(e.to, dist[e.to]));
			}
		}
	}
	return dist;
}

void main() {
	auto N = ri;
	auto tree = new Edge[][](N, 0);
	foreach(i; 0..N-1) {
		auto ip = readAs!(int[]), a = ip[0], b = ip[1], c = ip[2];
		a--; b--;
		tree[a] ~= Edge(b, c);
		tree[b] ~= Edge(a, c);
	}
	auto ip2 = readAs!(int[]), Q = ip2[0], K = ip2[1];
	K--;
	auto dist = dijkstra(tree, K);
	foreach(i; 0..Q) {
		auto ip3 = readAs!(int[]), x = ip3[0], y = ip3[1];
		x--; y--;
		writeln(dist[x] + dist[y]);
	}
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