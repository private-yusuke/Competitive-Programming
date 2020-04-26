void main() {
	auto N = ri;
	auto K = ri;
	auto A = readAs!(long[]);
	auto arr = new long[](N);
	arr[0] = A[0];
	foreach(i; 0..N-1) arr[i+1] = arr[i] + A[i+1];
	debug arr.writeln;
	long res = long.min;

	// K = 1:
	// 1-2-3-4-5-4-5
	// 1 2 3 44 55
	// 1-2-3-4-5-4-3-4-5
	// 1 2 33 444 55
	// 1-2-3-4-5-4-3-2-3-4-5
	// 1 22 333 444 55
	// 2 33 44 5
	// (1+2+3) + (3) + (1) + ((1+2) - 0)
	foreach(k; K..N) {
		long m;
		if(K == 1) {
			m = arr[k] + A[k-1] + A[k];
		} else {
			auto p = (k-K-1 < 0) ? 0 : arr[k-K-1];
			m = arr[k] + (arr[k] - p)*2 - A[k] - A[k-K];
			//writefln("%d %d*2 %d %d", arr[k], arr[k]-arr[k-K],A[k],A[k-K]);
		}
		if(res < m) debug k.writeln;
		res = max(res, m);
	}
	res.writeln;
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