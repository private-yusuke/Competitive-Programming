void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto t = new int[](N);
	auto d = new int[](N);
	alias Sushi = Tuple!(int, "t", int, "d");
	Sushi[] arr;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]), T = ip2[0], D = ip2[1];
		arr ~= Sushi(T, D);
	}
	
	arr.sort!"a.d > b.d"();
	Sushi[] tmp = arr[0..K].dup();
	foreach(i, v; arr[K..$]) {
		auto indices = tmp.map!(i => i.t).sort().group.filter!(i => i[1] > 1).map!(i => i[0]);
		
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
