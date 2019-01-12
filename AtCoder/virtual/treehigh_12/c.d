void main() {
	auto ip = readAs!(int[]), H = ip[0], W = ip[1];
	auto c = readMatrix!char(H, W);
	auto res = new int[][](H, W);
	foreach(ref i; res) i[] = -1;
	foreach(y, arr; c) {
		int last = -1;
		foreach(x, j; arr) {
			if(j == 'c') {
				res[y][x] = 0;
				last = x.to!int;
			} else if(last == -1) {
				res[y][x] = -1;
			} else {
				res[y][x] = x.to!int - last;
			}
		}
	}
	writefln("%(%(%d %)\n%)", res);
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
