void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto uf = new UnionFind!int(M+1);
	auto rbt = redBlackTree!int;
	foreach(i; 0..N) readAs!(int[])[1..$].tee!(i => rbt.insert(i)).array.zurasu(2).filter!(i => i.length == 2).each!(v => uf.unite(v[0], v[1]));
	auto rbt2 = redBlackTree!int;
	foreach(v; rbt) rbt2.insert(uf.root(v));
	if(rbt2.array.length == 1) writeln("YES");
	else writeln("NO");
}

// AtCoder上のDMDのバージョンが低いので、slideが使えない。代替策。
int[][] zurasu(int[] arr, ulong n) {
	typeof(return) res;
	foreach(i; 0..max(0, arr.length.to!int-n+1)) {
		res ~= arr[i..i+n];
	}
	return res;
}

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
