void main() {
	auto N = rs;
	string res, res2;
	int t;
	if(N == "0") {
		writeln("yES");
		writeln("yES");
		return;
	}
	foreach(v; N) t += v.to!int;
	if(t % 3 == 0 && N[N.length - 1].to!int % 2 == 0)
		res = "yES";
	else res = "nO";
	long tmp = 0;
	foreach(i, v; N) {
		if(i % 2 == 0) {
			tmp += v.to!int;
		} else {
			tmp -= v.to!int;
		}
	}
	if(tmp % 11 == 0) res2 = "yES";
	else res2 = "nO";
	res.writeln;
	res2.writeln;

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