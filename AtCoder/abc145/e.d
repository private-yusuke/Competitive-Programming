long[][] dp;
const ulong MAX = 1000000;
long[] fact, fact_inv, inv;
ulong MOD = 1000000007;

void main() {
	auto ip = readAs!(int[]), N = ip[0], T = ip[1];
	alias Pair = Tuple!(int, "a", int, "b");
	Pair[] pairs;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]), A = ip2[0], B = ip2[1];
		pairs ~= Pair(A, B);
	}
	pairs.sort!((x, y) => x.b > y.b);
	ulong res = 0;
	ulong k = 0;
	while(T != 0 && k < N) {
		auto p = pairs[k];
		if(T >= p.a) {
			res += p.b;
			T -= p.a;
		} else {
			T = 0;
			res += p.b;
		}
		k++;
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