void main() {
	alias Point = Tuple!(int, "x", int, "y");

	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	Point[] students;
	Point[] checks;

	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]);
		students ~= Point(ip2[0], ip2[1]);
	}
	foreach(i; 0..M) {
		auto ip3 = readAs!(int[]);
		checks ~= Point(ip3[0], ip3[1]);
	}
	foreach(i; students) {
		ulong min_p = 0;
		foreach(ind, j; checks) {
			if(abs(checks[min_p].x - i.x) + abs(checks[min_p].y - i.y) > abs(j.x - i.x) + abs(j.y - i.y)) {
				min_p = ind;
			}
		}
		(min_p+1).writeln;
	}
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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
