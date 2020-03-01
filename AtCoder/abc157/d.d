void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], K = ip[2];
	auto friendUF = new UnionFind!int(N);
	int[][] farr = new int[][](N, 0);
	int[][] barr = new int[][](N, 0);

	debug farr.writeln;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), A = ip2[0], B = ip2[1];
		friendUF.unite(A-1, B-1);
		debug writefln("%d %d", A, B);
		farr[A-1] ~= B-1;
		farr[B-1] ~= A-1;
	}
	foreach(i; 0..K) {
		auto ip3 = readAs!(int[]), C = ip3[0], D = ip3[1];
		barr[C-1] ~= D-1;
		barr[D-1] ~= C-1;
	}

	ulong[] res;
	foreach(i; 0..N) {
		auto n = farr[i].length;
		auto tmp = friendUF.size(i) - n;
		foreach(v; barr[i]) {
			if(friendUF.same(v, i)) tmp--;
		}
		res ~= (tmp - 1);
	}
	writefln("%(%d %)", res);
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