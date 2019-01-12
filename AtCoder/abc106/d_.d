void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], Q = ip[2];
	alias Pair = Tuple!(int, "L", int, "R");
	Pair[] pairs;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), L = ip2[0], R = ip2[1];
		pairs ~= Pair(L, R);
	}
	foreach(i; 0..Q) {
		ulong cnt;
		auto ip3 = readAs!(int[]), p = ip3[0], q = ip3[1];
		foreach(pa; pairs) {
			//writefln("[%d, %d], [%d, %d]", p, q, pa.L, pa.R);
			if(p <= pa.L && pa.R <= q) cnt++;
		}
		cnt.writeln;
	}
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