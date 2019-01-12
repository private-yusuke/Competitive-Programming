void main() {
	long INF = 1 << 30;
	auto ip = readAs!(long[]), N = ip[0], H = ip[1];
	auto ip2 = readAs!(long[]), A = ip2[0], B = ip2[1], C = ip2[2], D = ip2[3], E = ip2[4];
	
	long M = B*A + H + 1;
	auto dp = new long[][](N+1, M);
	foreach(ref i; dp) i[] = INF;
	dp[0][H] = 0;
	foreach(d; 0..N+1) {
		foreach(j; 1..M) {
			if(j + B < M) dp[d+1][j+B] = min(dp[d+1][j+B], dp[d][j]+A);
			if(j + D < M) dp[d+1][j+D] = min(dp[d+1][j+D], dp[d][j]+C);
			if(j > E) dp[d+1][j-E] = min(dp[d+1][j-E], dp[d][j]); 
		}
	}
	long res = long.max;
	foreach(j; 0..M) res = min(res, dp[N][j]);
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
