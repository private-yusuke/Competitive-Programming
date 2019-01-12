void main() {
	alias Point = Tuple!(int, "x", int, "y", bool, "done");
	auto N = ri;
	Point[] red, blue;
	foreach(_; 0..N) { auto r = readAs!(int[]); red ~= Point(r[0], r[1], false); }
	foreach(_; 0..N) { auto r = readAs!(int[]); blue ~= Point(r[0], r[1], false); }
	red.sort!"a.x > b.x";
	blue.sort!"a.x < b.x";

	int res;
	foreach(b; blue) {
		ulong max_r = 0;
		bool found = false;
		foreach(i, r; red) {
			if(!r.done && r.x < b.x && r.y < b.y) {
				if(red[max_r].y < r.y) max_r = i;
				found = true;
			}
		}
		if(found) {
			res++;
			red[max_r].done = true;
		}
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
