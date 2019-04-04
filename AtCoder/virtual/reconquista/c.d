void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	alias Pair = Tuple!(int, "P", int, "Y", int, "index", int, "bangou");
	Pair[][int] pairs;
	auto rbt = redBlackTree!int;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), P = ip2[0], Y = ip2[1];
		pairs[P] ~= Pair(P, Y, i, -1);
		rbt.insert(P);
	}
	Pair[] res;
	foreach(i; rbt.array) {
		auto arr = pairs[i].sort!"a.Y < b.Y";
		foreach(j; 0..arr.length) {
			auto v = arr[j];
			res ~= Pair(v.P, v.Y, v.index, (j+1).to!int);
		}
	}
	foreach(v; res.sort!"a.index < b.index"()) {
		writefln("%.6d%.6d", v.P, v.bangou);
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
