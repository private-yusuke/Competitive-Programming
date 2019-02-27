void main() {
	auto ip = readAs!(int[]), A = ip[0], B = ip[1], Q = ip[2];
	auto s = A.iota.map!(i => ri).array.assumeSorted;
	auto t = B.iota.map!(i => ri).array.assumeSorted;
	foreach(i; 0..Q) {
		auto x = ri;
		auto s_l = s.lowerBound(x).array.length;
		auto s_r = s.upperBound(x).array.length;
		auto t_l = t.lowerBound(x).array.length;
		auto t_r = t.upperBound(x).array.length;
		writefln("%d %d %d %d", s_l, s_r, t_l, t_r);
		writefln("%d %d %d %d", s[s_l], s[s_r], t[t_l], t[t_r]);
	}
	
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
