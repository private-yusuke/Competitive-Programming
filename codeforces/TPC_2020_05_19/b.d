void main() {
	auto ip = readAs!(real[]), a = ip[0], d = ip[1];
	const real K = 10000000;
	auto A = (a * K).to!long, D = (d * K).to!long;
	auto n = ri;
	long current;
	auto m = D % (4*A);
	foreach(i; 0..n) {
		current += m;
		current %= (4*A);
		auto res = current / K;
		debug current.writeln;
		debug res.writeln;
		if(res <= a) {
			writefln("%.9f %.9f", res, 0.to!real);
		} else if(res <= 2*a) {
			writefln("%.9f %.9f", a, res-a);
		} else if(res < 3*a) {
			writefln("%.9f %.9f", 3*a - res, a);
		} else {
			writefln("%.9f %.9f", 0.to!real, 4*a - res);
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}