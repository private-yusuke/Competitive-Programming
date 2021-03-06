void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto A = readAs!(int[]);
	
	int[] c = [2,5,5,4,5,6,3,7,6];
	auto dp = new string[](11000);
	dp[] = "ア!w";
	dp[0] = "";
	void chmax(ref string a, string b) {
		if(a == "ア!w") a = b;
		else if(a.length < b.length) a = b;
		else if(a.length == b.length && a < b) a = b;
	}
	
	foreach(i; 0..10000) {
		if(dp[i] == "ア!w") continue;
		foreach(v; A) chmax(dp[i+c[v-1]], dp[i] ~ v.to!string);
	}
	dp[N].writeln;
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
