void main() {
	auto ip = readAs!(int[]), N = ip[0], C = ip[1];
	int[] x, v;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]);
		x ~= ip2[0];
		v ~= ip2[1];
	}
	int res;

	int[] dp = new int[](N+1);
	int current_x;
	dp[0] = max(0, v[0] - x[0], v[0] - (C - x[0]));

	foreach(i; 1..N) {
		dp[i] = max(dp[i-1], v[i] - abs(current_x - x[i]));
		if(dp[i-1] < v[i] - (current_x - x[i]))
	}
	dp[N-1].writeln;
}
// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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
