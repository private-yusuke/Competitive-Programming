void main() {
	auto ip = readAs!(int[]), x_1 = ip[0], y_1 = ip[1], x_2 = ip[2], y_2 = ip[3];
	auto dy = abs(y_2 - y_1), dx = abs(x_2 - x_1);

	if(x_1 < x_2) {
		if(y_1 > y_2) {
			p(x_2 + dy, y_2 + dx, x_1 + dy, y_1 + dx);
		} else {
			p(x_2 - dy, y_2 + dx, x_1 - dy, y_1 + dx);
		}
	} else {
		if(y_1 > y_2) {
			p(x_2 + dy, y_2 - dx, x_1 + dy, y_1 - dx);
		} else {
			p(x_2 - dy, y_2 - dx, x_1 - dy, y_1 - dx);
		}
	}
}

void p(int a, int b, int c, int d) {
	writefln("%d %d %d %d", a, b, c, d);
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