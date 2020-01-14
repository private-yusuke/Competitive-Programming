void main() {
	auto ip = readAs!(int[]), N = ip[0], L = ip[1];
	auto c = readMatrix!char(L, N*2-1);
	ulong g;
	foreach(i, v; rs) {
		if(v == 'o') g = i;
	}
	debug c.writeln;

	foreach_reverse(i, v; c) {
		debug g.writeln;
		debug v.writeln;
		if(g > 0 && v[g-1] == '-') {
			g -=2;
		} else if(g < N*2 - 2 && v[g+1] == '-') {
			g += 2;
		}
	}
	(g/2 + 1).writeln;

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