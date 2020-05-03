void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], Q = ip[2];
	alias Pair = Tuple!(int, "a", int, "b", int, "c", int, "d");
	Pair[] pairs;
	foreach(i; 0..Q) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1], c = ip2[2], d = ip2[3];
		pairs ~= Pair(a, b, c, d);
	}
	auto arr = new bool[](100000 * 50 + 1);
	// 10^5 * Q * Q = 
	arr[0] = true;
	foreach(i; 0..Q) {
		foreach_reverse(j; 0..arr.length) if(arr[j]) {
			//writefln("%d %d", i, j);
			arr[j+pairs[i].d] = true;
		}
	}
	long[] arr2;
	foreach_reverse(j; 0..arr.length) if(arr[j]) {arr2 ~= j;}
	debug arr2.length.writeln;

	bool C(long n) {

		foreach(k; 0..2^^Q) {
			auto b = format("%%.%db".format(Q), k);
			long tmp;
			foreach(i; 0..Q) {
				if(b[i] == '1') tmp += pairs[i].d;
			}
			if(tmp == 357500) writeln(b);
		}
		return true;
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