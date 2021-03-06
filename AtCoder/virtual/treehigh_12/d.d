long N, M;
long[] D, C;
long[][] dp;
const long INF = 1 << 30;

void main() {
	auto ip = readAs!(long[]);
	N = ip[0], M = ip[1];
	dp = new long[][](N+1, M+1);
	
	foreach(i; 0..N) D ~= ri;
	foreach(i; 0..M) C ~= ri;
	foreach(ref arr; dp) arr[] = INF;
	dp[0][0] = 0;
	
	foreach(i; 0..N) {
		foreach(j; 0..M) {
			dp[i][j+1] = min(dp[i][j+1], dp[i][j]);
			dp[i+1][j+1] = min(dp[i+1][j+1], dp[i][j] + D[i] * C[j]);
		}
	}
	dp[N][N..M+1].reduce!min.writeln;
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
