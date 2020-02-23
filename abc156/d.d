/*
 * じょえチャンネルを応援します！
 * https://www.youtube.com/watch?v=gPFr7q7eLL8
 */
void main() {
	auto ip = readAs!(ulong[]), n = ip[0], a = ip[1], b = ip[2];
	const ulong MOD = 1000000007;
	ulong res = pow_mod(2, n, MOD);
	res--;
	res = res - mod_comb(n, a, MOD) + MOD;
	res %= MOD;
	res = res - mod_comb(n, b, MOD) + MOD;
	res %= MOD;
	res.writeln;
}

ulong pow_mod(ulong n, ulong k, ulong m) {
	if(k==0) return 1;
	else if(k & 1) return pow_mod(n, k-1, m) * n % m;
	else {
		ulong t = pow_mod(n, k>>1, m);
		return t * t % m;
	}
}

ulong mod_comb(ulong n, ulong r, ulong m) {
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
	debug writefln("n, r, res: %d, %d, %d", n, r, res);
	return res;
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
			//fact[i] = fact[i - 1] * i % MOD;
			inv[i] = MOD - inv[MOD%i] * (MOD / i) % MOD;
			//finv[i] = finv[i - 1] * inv[i] % MOD;
		}
	}

	ulong nCr(long n, long k) {
		if(n < k) return 0;
		if(n < 0 || k < 0) return 0;
		debug writefln("%d %d", n, k);
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