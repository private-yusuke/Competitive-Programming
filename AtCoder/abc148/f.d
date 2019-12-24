void main() {
	auto ip = readAs!(int[]), N = ip[0], u = ip[1], v = ip[2];
	auto tree = new Edge[][](N,0);
	foreach(i; 0..N-1)
	{
		auto ip2 = readAs!(int[]), A = ip2[0], B = ip2[1];
		A--; B--;
		tree[A] ~= Edge(B, 1);
		tree[B] ~= Edge(A, 1);
	}
	auto distv = dijkstra(tree, v-1);
	auto distu = dijkstra(tree, u-1);

	ulong res = 0;
	foreach(i; 0..N) {
		if(distu[i] < distv[i]) {
			res = max(res, distv[i]);
		}
	}
	writeln(res - 1);
}

const inf = (1<<30);

alias Edge = Tuple!(int,"to", int ,"cost");
alias tie = Tuple;

int[] dijkstra(in Edge[][] tree, int start) {
    import std.container;
    import std.algorithm;
    alias PriorityQueue = BinaryHeap;

    ulong V = tree.length;
    auto dist = new int[V];
    fill(dist, inf);

    // priority_queue
    auto queue = new PriorityQueue!(Array!Edge, "a.cost>=b.cost")();

    dist[start] = 0;
    queue.insert(Edge(start,0));
    while (!queue.empty())
    {
        int v;
        int cost;
        auto aaaa = queue.front();
        v = aaaa[0], cost = aaaa[1];
        queue.popFront();

        // another shorter path was already found, skip
        if (dist[v] < cost)
            continue;
        foreach(const ref Edge e; tree[v])
        {
            if (dist[v] + e.cost < dist[e.to])
            {
                dist[e.to] = dist[v] + e.cost;
                // found new shorter path,
                // push to queue for re-calculate path
                queue.insert(Edge(e.to, dist[e.to]));
            }
        }
    }
    return dist;
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