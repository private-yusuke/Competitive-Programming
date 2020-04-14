void main() {
	auto N = ri;
	auto S = rs;
	auto warr = new int[](N);
	warr[0] = (S[0] == 'W' ? 1 : 0);
	foreach(i; 0..N-1) warr[i+1] = (S[i+1] == 'W' ? 1 : 0) + warr[i];

	auto f(int n) {
		return n+1 - warr[n];
	}

	int res = int.max;
	foreach(i; 0..N) {
		int tmp;
		tmp += f(N-1) - f(i);
		tmp += i < 1 ? 0 : warr[i-1];
		res = min(res, tmp);
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