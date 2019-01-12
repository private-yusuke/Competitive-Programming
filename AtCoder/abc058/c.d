void main() {
	auto n = ri;
	int[dchar][int] a;
	auto c = new RedBlackTree!dchar;
	foreach(i; 0..n) {
		auto S = rs;
		foreach(j; S) {
			a[i][j]++;
			c.insert(j);
		}
	}
	debug a.writeln;
	int[dchar] b;
	foreach(i; c.array) b[i] = int.max;
	foreach(i; a) {
		debug i.writeln;
		foreach(j; c.array) {
			if(j in i) b[j] = min(b[j], i[j]);
			else b[j] = 0;
		}
	}
	dstring res;
	foreach(i; c.array) {
		res ~= i.repeat(b[i]).array;
	}
	res.writeln;
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