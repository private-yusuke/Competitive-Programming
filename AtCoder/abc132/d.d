void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto FP = new COM(2001, 1000000007);
	foreach(i; 1..K+1) {
		writeln((FP.nCr(N-K+1, i) * FP.nCr(K-1, i-1)) % 1000000007);
	}
}

class COM {
	long[] fact, finv, inv;
	private ulong MAX;
	private ulong MOD;

	this(ulong MAX, ulong MOD) {
		this.MAX = MAX;
		this.MOD = MOD;
		fact = new long[](MAX);
		finv = new long[](MAX);
		inv = new long[](MAX);

		// initialize the arrays
		fact[0] = fact[1] = 1;
		finv[0] = finv[1] = 1;
		inv[1] = 1;
		foreach(i; 2..MAX) {
			fact[i] = fact[i - 1] * i % MOD;
			inv[i] = MOD - inv[MOD%i] * (MOD / i) % MOD;
			finv[i] = finv[i - 1] * inv[i] % MOD;
		}
	}

	ulong nCr(long n, long k) {
		if(n < k) return 0;
		if(n < 0 || k < 0) return 0;
		assert(n < MAX && k < MAX);
		return fact[n] * (finv[k] * finv[n - k] % MOD) % MOD;
	}
	ulong factorial(long n) {
		return fact[n];
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