void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1], K = ip[2];

	auto com = new COM(N+1, 998244353);

	long res;
	long col = M;
	foreach_reverse(i; 0..N) {
		long now = col;
		now *= com.nCr(N-1, i);
		if(i <= K) res += now;
		col *= M-1;
		col %= 998244353;
		res %= 998244353;
	}
	res.writeln;
}

/*
 * Only N <= 10^7 is acceptable.
 * preparation: O(MAX)
 * query: O(1)
 */
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

/*
 * N <= 10^18, r <= 10^7 is acceptable.
 * query: O(r)
 */
ulong mod_comb(long n, long r, long m) {
	if(n < r || n < 0 || r < 0) return 0;
	if(r*2 > n) r = n - r;
	if(r == 0) return 1;
	if(r == 1) return n;
	auto inv = new ulong[](r+1);
	auto finv = new ulong[](r+1);
	inv[1] = 1;
	finv[0] = finv[1] = 1;
	foreach(i; 2..r+1) {
		inv[i] = m - inv[m % i] * (m / i) % m;
		finv[i] = finv[i - 1] * inv[i] % m;
	}
	ulong res = 1;
	foreach(i; n-r+1..n+1) (res *= i) %= m;
	(res *= finv[r]) %= m;
	return res;
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}