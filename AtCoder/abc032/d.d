long[][] dp;
ulong[] v, w;
int N, W;

void main() {
	auto ip = readAs!(int[]);
	N = ip[0], W = ip[1];
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1];
		v ~= a;
		w ~= b;
	}
	dp = new long[][](N, W+1);
	foreach(ref arr; dp) arr[] = -1;
	foreach(ref arr; dp) arr[0] = 0;
	solve(0, W).writeln;
	//dp.writeln;
}

// i番目以降の荷物を選択する
ulong solve(ulong i, ulong j) {
	if(i==N) return 0;
	if(dp[i][j] >= 0) return dp[i][j];
	if(j < w[i]) return solve(i+1, j);
	return max(solve(i+1, j), solve(i+1, j-w[i])+v[i]);
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
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