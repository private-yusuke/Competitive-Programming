void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], X = ip[2], Y = ip[3];
	auto x = readAs!(int[]);
	auto y = readAs!(int[]);
	bool ok;
	foreach(Z; -100..101) {
		bool flag = false;
		if(!(X < Z && Z <= Y)) flag = true;
		foreach(i; x) {
			if(!(i < Z)) flag = true;
		}
		foreach(i; y) {
			if(!(i >= Z)) flag = true;
		}
		if(!flag) ok = true;
	}
	writeln(!ok ? "War" : "No War");
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