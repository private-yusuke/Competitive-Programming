void main() {
	alias Point = Tuple!(int, "x", int, "y");

	auto N = ri;
	Point[] points;
	foreach(i; 0..N) {
		auto ip = readAs!(int[]), x = ip[0], y = ip[1];
		points ~= Point(x, y);
	}
	real res = -1;
	foreach(i; points) foreach(j; points) {
		if(i==j) continue;
		res = max(res, (abs(i.x - j.x).pow(2) + abs(i.y - j.y).pow(2)).to!real.sqrt);
	}
	writefln("%.10f", res);
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