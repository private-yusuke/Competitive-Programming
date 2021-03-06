long conv(ulong n) {
	switch(n) {
		case 1: return 2;
		case 2, 3, 5: return 5;
		case 4: return 4;
		case 6, 9: return 6;
		case 7: return 3;
		case 8: return 7;
		default: return 0;
	}
}

BigInt[][] dp;
long[] avail;

BigInt calc(int i, long j) {
	debug writefln("IN i: %d, j: %d", i, j);
	if(dp[i][j] >= 0) return dp[i][j];
	if(i <= 0) return 0.BigInt;
	
	BigInt tmp = dp[i-1].reduce!max;
	foreach(int id, n; avail) {
		id.writeln;
		if(j >= conv(n)) tmp = max(tmp, calc(i-1, j-conv(n)) * 10 + n);
	}
	
	debug writefln("OUT i: %d, j: %d, tmp: %d", i, j, tmp);
	return dp[i][j] = tmp > 0.BigInt ? tmp : 0.BigInt;
}

const ulong MA = 30;
void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	avail = readAs!(long[]);
	dp = new BigInt[][](MA, N+1);
	foreach(ref v; dp) v[] = -1.BigInt;
	foreach(ref v; dp[0]) v = 0;
	
	calc(MA-1, N);
	BigInt res;
	foreach(v; dp) res = res < v[N] ? v[N] : res;
		
	auto S = res.to!string[0].to!string.to!ulong;
	dp.each!writeln;
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
