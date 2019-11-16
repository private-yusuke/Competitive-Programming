long[][] dp;
const ulong MAX = 1000000;
long[] fact, fact_inv, inv;
ulong MOD = 1000000007;

void main() {
	auto ip = readAs!(int[]), X = ip[0], Y = ip[1];
	fact = new long[](MAX);
	fact_inv = new long[](MAX);
	inv = new long[](MAX);

	fact[0] = fact[1] = 1;
	fact_inv[0] = fact_inv[1] = 1;
	inv[1] = 1;
	foreach(i; 2..MAX) {
		fact[i] = fact[i - 1] * i % MOD;
		inv[i] = MOD - inv[MOD%i] * (MOD / i) % MOD;
		fact_inv[i] = fact_inv[i - 1] * inv[i] % MOD;
	}

	long COM(int n, int k) {
		if(n < k) return 0;
		if(n < 0 || k < 0) return 0;
		return fact[n] * (fact_inv[k] * fact_inv[n - k] % MOD) % MOD;
	}

	auto k = (X + Y) / 3;
	if((X + Y) % 3 != 0) {
		writeln(0);
		return;
	}
	COM(k, X-k).writeln;
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