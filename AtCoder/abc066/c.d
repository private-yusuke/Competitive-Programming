void main() {
	auto n = ri;
	auto a = readAs!(int[]);
	writefln("%(%d %)", rng(n).map!(i => a[i]));
}

auto rng(int n) {
	int[] tmp;
	if(n%2 == 0) {
		tmp ~= iota(n, 0, -2).array;
		tmp ~= iota(1, n, 2).array;
	} else {
		tmp ~= iota(n, 0, -2).array;
		tmp ~= iota(2, n, 2).array;
	}
	return tmp.map!(i => --i);
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
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