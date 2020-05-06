void main() {
	auto ip = readAs!(int[]), s = ip[0], n = ip[1];
	alias Pair = Tuple!(int, "x", int, "y");
	Pair[] pairs;
	foreach(i; 0..n) {
		auto ip2 = readAs!(int[]), x = ip2[0], y = ip2[1];
		pairs ~= Pair(x, y);
	}
	pairs.sort!((a, b) => a.x < b.x);
	foreach(v; pairs) {
		if(s > v.x) {
			s += v.y;
		} else {
			writeln("NO");
			return;
		}
	}
	writeln("YES");
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}