void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1], Q = ip[2];
	alias Pair = Tuple!(long, "a", long, "b", long, "c", long, "d");
	Pair[] pairs;
	foreach(i; 0..Q) {
		auto ip2 = readAs!(long[]), a = ip2[0], b = ip2[1], c = ip2[2], d = ip2[3];
		pairs ~= Pair(a, b, c, d);
	}

	long[][] arr2;
	long[] rec(long[] ar) {
		if(ar.length == N) return ar;
		auto k = ar.back;
		foreach(v; k..M+1) {
			auto m = rec(ar ~ v);
			if(m) arr2 ~= m;
		}
		return [];
	}
	long res;
	foreach(k; 1..M+1) rec([k]);
	debug arr2.each!writeln;
	foreach(v; arr2) {
		long tmp;
		foreach(p; pairs) {
			if(v[p.b-1] - v[p.a-1] == p.c) {
				tmp += p.d;
			}
		}
		res = max(res, tmp);
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