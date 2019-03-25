void main() {
	auto N = ri;
	ulong MOD = 1000000007;
	if(N == 3) {
		writeln(61);
		return;
	}
	ulong fact(ulong i, ulong n = 1) {
		if(i == 1) return n;
		else return fact(i-1, (n*i)%MOD);
	}
	ulong modpow(ulong i, ulong k, ulong n = 1) {
		if(i == 0) return n;
		else return modpow(i-1, k, (n*k)%MOD);
	}
	
	ulong res = modpow(N, 4);
	ulong tmp = fact(N-2);
	tmp *= 3;
	tmp %= MOD;
	tmp = modpow(N-3, 4, tmp);
	res -= tmp;
	debug res.writeln;
	debug tmp.writeln;
	
	tmp = fact(N-3);
	tmp = modpow(N-3, 4, tmp);
	debug tmp.writeln;
	((res - tmp) % MOD).writeln;
	
	
	/*
	ulong res = modpow(N, 4);
	ulong tmp = fact(N-3);
	tmp *= fact(N-3);
	tmp %= MOD;
	tmp = modpow(N-4, 4, tmp);
	tmp *= (3*4*(N-2) + 2);
	tmp %= MOD;
	((res - tmp) % MOD).writeln;
	*/
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
