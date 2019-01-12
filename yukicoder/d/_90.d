void main() {
	alias Pair = Tuple!(int, "first", int, "second", int, "score");
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	int[] a = iota(N).array;
	Pair[] p;
	foreach(_; 0..M) {
		auto ip2 = readAs!(int[]), item1 = ip2[0], item2 = ip2[1], score = ip2[2];
		p ~= Pair(item1, item2, score);
	}
	ulong res;
	do {
		ulong tmp;
		foreach(i; p) {
			auto j = a.search(i.first);
			auto k = a.search(i.second);
			if(j > k) tmp += i.score;
			debug writefln("%d, %d", j, k);
		}
		res = max(res, tmp);
		debug tmp.write;
		debug a.writeln;
	} while(nextPermutation(a));
	res.writeln;
	debug a.writeln;
}

ulong search(int[] a, int b) {
	foreach(i; 0..a.length) {
		if(a[i] == b) return i;
	}
	return 0;
}

// ===================================

import std.stdio;
import std.string;
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