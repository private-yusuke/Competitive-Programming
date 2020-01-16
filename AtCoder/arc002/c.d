void main() {
	auto N = ri;
	auto c = rs;
	ulong res = ulong.max;
	foreach(c1; "ABXY") foreach(c2; "ABXY") foreach(c3; "ABXY") foreach(c4; "ABXY") {
		auto abbr1 = [c1, c2];
		auto abbr2 = [c3, c4];
		auto dp = new ulong[](N);
		foreach(i, ref v; dp) v = i + 1;
		foreach(i; 1..N) {
			auto p = c[i-1..i+1];
			if(p == abbr1 || p == abbr2) {
				if(i == 1) dp[i] = 1;
				else dp[i] = dp[i-2] + 1;
			} else dp[i] = dp[i-1] + 1;
		}
		res = min(res, dp.back);
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