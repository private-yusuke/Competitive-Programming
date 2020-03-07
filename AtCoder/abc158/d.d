void main() {
	auto S = rs.to!dstring;
	auto Q = ri;
	dstring right, left;
	bool flip = false;
	foreach(i; 0..Q) {
		auto ip = readln.split, T = ip[0];
		if(T == "1") {
			flip = !flip;
			continue;
		} else {
			auto F = ip[1].to!int, C = ip[2][0];
			if((F + flip + 1)  % 2) {
				right ~= C;
				debug writefln("right: %s", C);
			}
			else {
				left ~= C;
				debug writefln("left: %s", C);
			}
		}
	}
	dstring res = left.retro.array ~ S ~ right;
	if(flip) writeln(res.retro);
	else writeln(res);
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