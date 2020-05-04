void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto H = readAs!(int[]);
	alias Pair = Tuple!(int, "A", int, "B");
	Pair[] pairs;
	int[][] paths = new int[][](N);
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), A = ip2[0], B = ip2[1];
		paths[A-1] ~= B-1;
		paths[B-1] ~= A-1;
	}
	
	ulong res;
	foreach(i; 0..N) {
		debug writeln;
		bool flag = true;

		foreach(v; paths[i]) {
			debug "%d %d".writefln(i, v);
			if(H[v] < H[i]) {
			} else flag = false;
		}
		if(flag) {
			res++;
			debug "ok".writeln;
		}
	}
	res.writeln;
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