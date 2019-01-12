void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	alias Pair = Tuple!(int, "year", int, "index", int, "bangou", int, "ken");
	Pair[][int] pairs;
	auto kens = redBlackTree!int;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), P = ip2[0], Y = ip2[1];
		pairs[P] ~= Pair(Y, i, -1, P);
		kens.insert(P);
	}
	Pair[][] res;
	//pairs.writeln;
	foreach(p; kens.array) {
		auto arr = pairs[p].sort!"a.year < b.year"();
		foreach(i; 0..arr.length) {
			arr[i] = Pair(arr[i].year, arr[i].index, (i+1).to!int, arr[i].ken);
		}
		res ~= arr.array;
	}
	
	foreach(i; res.join.sort!"a.index < b.index") {
		writefln("%.6d%.6d", i.ken, i.bangou);
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
