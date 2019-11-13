void main() {
	auto N = ri;
	auto D = readAs!(long[]);
	if(D[0] != 0 || D[1..$].any!(i => i == 0) || (arr => iota(arr.length).array != arr)(D.sort().uniq.array)) {
		writeln(0);
		return;
	}
	long MOD = 998244353;
	long res = 1;
	auto arr = D.sort().array.group.map!(i => i[1]).array;
	foreach(i; 0..arr.length-1) {
		foreach(_; 0..arr[i+1]) {
			res *= arr[i];
			res %= MOD;
		}
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
