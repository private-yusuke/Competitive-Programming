void main() {
	auto n = ri;
	auto a = readAs!(int[]);

	// +, -, +, ...
	long res;
	long tmp;
	foreach(i, v; a) {
		tmp += v;
		if(i % 2 == 0) {
			if(tmp <= 0) {
				res += -tmp + 1;
				tmp = 1;
			}
		} else {
			if(tmp >= 0) {
				res += tmp + 1;
				tmp = -1;
			}
		}
	}

	long res2;
	tmp = 0;

	// -, +, -, ...
	foreach(i, v; a) {
		tmp += v;
		if(i % 2 == 0) {
			if(tmp >= 0) {
				res2 += tmp + 1;
				tmp = -1;
			}
		} else {
			if(tmp <= 0) {
				res2 += -tmp + 1;
				tmp = 1;
			}
		}
	}
	
	debug writefln("%d %d", res, res2);
	min(res, res2).writeln;
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