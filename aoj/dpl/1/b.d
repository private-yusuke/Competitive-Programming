void main() {
	auto ip = readAs!(int[]);
	N = ip[0], W = ip[1];
	
	dp = new int[][](N+1, W+1);
	foreach(ref i; dp) i[] = -1;
	
	foreach(_; 0..N) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1];
		v ~= a; w ~= b;
	}
	
	calc(0, W).writeln;
}

int N, W;
int calc(int i, int j) {
	debug writefln("%d, %d", i, j);
	if(dp[i][j] >= 0) return dp[i][j];
	
	if(i == N) return 0;
	if(j < w[i]) return dp[i][j] = calc(i + 1, j);
	return dp[i][j] = max(calc(i + 1, j), calc(i + 1, j - w[i]) + v[i]);
}


int[][] dp;
int[] v, w;

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
