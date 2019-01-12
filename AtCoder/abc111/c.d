void main() {
	alias Pair = Tuple!(int, "value", int, "count");
	auto n = ri;
	auto v = readAs!(int[]);
	Pair[] e, o;
	foreach(i; 0..100000) {
		e ~= Pair(i, 0);
		o ~= Pair(i, 0);
	}
	foreach(i, j; v) {
		if(i & 1) {
			o[j-1].count++;
		} else e[j-1].count++;
	}
	sort!"a.count > b.count"(e);
	sort!"a.count > b.count"(o);
	if(e[0].value != o[0].value) {
		writeln(n - e[0].count - o[0].count);
	} else {
		writeln(n - max(e[0].count + o[1].count, e[1].count + o[0].count));
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