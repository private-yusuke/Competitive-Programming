void main() {
	auto N = ri;
	auto arr = new int[](24*12 + 1);
	foreach(i; 0..N) {
		auto ip = readln.chomp;
		auto Sh = ip[0..2].to!int;
		auto Sm = (ip[2..4].to!int / 5 * 5);
		auto S = Sh * (60 / 5) + Sm;

		auto Eh = ip[5..7].to!int;
		auto Em = (ip[7..9].to!int / 5 * 5) + (ip[7..9].to!int % 5 != 0 ? 5 : 0);
		auto E = Eh * (60 / 5) + Sm;
		writefln("%d, %d", S, E);
		writefln("%s, %s, %s, %s", ip[0..2], ip[2..4], ip[5..7], ip[7..9]);
		writefln("%.2d, %.2d, %.2d, %.2d", Sh, Sm, Eh, Em);
		arr[S..E] += 1;
	}
	auto arr2 = arr.enumerate.filter!(i => i.value != 0).array;

	ulong t0 = arr2[0].index;
	arr2.each!writeln;

	foreach(i; 0..arr2.length-1) {
		auto a = arr2[i], b = arr2[i+1];
		if(b.index - a.index != 1) {
			auto Sh = t0 / 12;
			auto Sm = (t0 % 12) * 5;
			auto Eh = a.index / 12;
			auto Em = (a.index % 12) * 5;
			writefln("%.2d%.2d-%.2d%.2d", Sh, Sm, Eh, Em);
			t0 = b.index;
		}
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