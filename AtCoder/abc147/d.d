void main() {
	auto N = readAs!ulong;
	auto A = readAs!(ulong[]);
	auto bits = new ulong[](64);
	foreach(v; A) {
		foreach(k; 0..64) {
			ulong n = 1UL << k;
			if(v & n) bits[k]++;
		}
	}
	ulong res;
	ulong MOD = 1000000007;
	foreach(i; 0..64) {
		ulong tmp = (1UL << i);
		tmp %= MOD;
		tmp *= bits[i];
		tmp %= MOD;
		tmp *= (N - bits[i]);
		tmp %= MOD;
		res += tmp;
		res %= MOD;
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